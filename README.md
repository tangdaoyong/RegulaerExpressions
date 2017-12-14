# RegulaerExpressions
Swift中的谓词处理

>[示例代码](https://github.com/tangdaoyong/RegulaerExpressions)

### NSPredicate

```Swift
	let predicate = NSPredicate(format: "SELF MATCHES %@", myRegularExpressions)
    predicate.evaluate(with: self) == true
```

### 直接查找匹配

```Swift
	let range = self.range(of: myRegularExpressions, options: String.CompareOptions.regularExpression, range: nil, locale: nil)
    range != nil
```

### NSRegularExpression

```Swift
	var myRE:NSRegularExpression!
        try myRE = NSRegularExpression.init(pattern: myRegularExpressions, options: options)//NSRegularExpression.Options.caseInsensitive不区分大小写的搜索
        let result = myRE.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange.init(location: 0, length: self.characters.count))
        //let resultArr = myRE.matches(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange.init(location: 0, length: self.characters.count))//抓取多个结果
        result != nil//是否成功
```

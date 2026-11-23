Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA7606A327
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VYFkFTz7;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=MFGT00P7;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=OkYgAqnm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k0RbCPIrbIwVAOcZRQzZwRgfQ9cn9j/Wms9N45tji9M=; b=VYFkFTz7XJ7eBAUfH/hK07to/P
	oBOQxxJhEXErqYyG0ds9CtzoC2vv5e3t25ZgvNCHET01RxdFaPrnwh6cgB3u5od+eXsO/sKcvKtzP
	8X6g2HMAf39VusjqWxJnOzYmVi7YSB3hrvDHirWGPjYfEh7VY4A4cm+b5Fpj3yW1uY/3ryzc7gu0K
	2Ibo1gzEEZwAHRqowttZR3FyBPT/z4021UTmI8rIsTxkEzsKv7pkZcAImibvG7qbRTyyMmC6V1i/K
	CRRmt2GUXlQdjVOMHVY3kmsk44AuKDSMF1FKcg8yneWDRIh8bo6BwJwGJd+RD33YQDh/fOX1l/icf
	3i7kFnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTcD-00000003UAq-41lf;
	Mon, 23 Nov 2026 12:57:49 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTcB-00000003U9t-1OWR
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 12:57:48 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AN5YGPp1523048;
	Mon, 23 Nov 2026 13:57:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=k0RbCPIrbIwVAOcZRQzZwR
	gfQ9cn9j/Wms9N45tji9M=; b=MFGT00P70jUgEEwXjS+dIkHl/JEngNkEk/y+34
	OxREJStaeYMaI8YOiMiOAvP4orVg3OP9gm04eJ0do3bQBoQly0syE5UTJbzXtP3U
	X0DVi+XrYaCZVKv9KGPQhtxkHIzqSz3motlxLIErruvWS7IqIFwZlsyqzfXblE2R
	siX6aTuwvCpdSMd6ai/AWjCe9gcR/BSFINijsPh2lEIs5Jv7zKvL1z+4cK6PoW0i
	Z7dcu1bSJFJJmCRRaIOA3XbZ2G34WI5BFyzqpaKLBnjd4vkZHVxM83O4d8j582RG
	CsHoQFgGl0fygi4ULL4ZrvOBNnmYQoUt1WWD4AeJDvjrmI4A==
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11023136.outbound.protection.outlook.com [52.101.83.136])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j30hk2by9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Mon, 23 Nov 2026 13:57:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v96wKJad8te2YHTmmTxNUanQ0sr5tKAGAU2enK9Wv9JvcNpqvqDsyYUQOc+4ZOhXrd1KREp+A5TzrJ795ojmQr2IKzqc7314XNHUMmTMF+DfRmNdE3QTbL7688utFqe4lKoBsAgt3F5Hu2X97k941EnISELYGg/qentojJhas167IXdFYxi8G+WJQ9+Ez9fAHPjx2WS92yF46g/1AeE26E3fkMJjfRDpBiccsFNY9k4Zj6bFfwbLOuZl9YRFRJdleX8lQOpC64F9KtkRiOiqrhTokSUxLwHtMLtBJL45OEb9DqntK1ish5vAKk4CMX5uiMq3OREN4wRlya1dluTgHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0RbCPIrbIwVAOcZRQzZwRgfQ9cn9j/Wms9N45tji9M=;
 b=Hf8kxvxY/2GyW0FXASMt0WyKt24i+OVPCACDg9pTuZM9axtz5m/yjlxjqypqyCQRVGkt2X4blmwF5Z78oBpLNfHyjMh3DA7Ls1dhrkC+lNJJ9WY7gIhGoudLO+SBIXCMQbB4n05orhkPLn8oMm3miYdySJ/0DDRj/k9Wc1e//byR2HVSKCjRs7zJuIFOCEnv0RFKWJs6rVdY1/kyt0sO4Bsd5TGeZRm1UdRq5yGdn/369gkzbcm/rTTDjWjlhhoVDhpECLzFoT9BzGRfJdMtvpeyajtryWGAMq/O5Slm9bfIJ3UXj3UNWwgQuGuRakKqO/TzY0VNAK8kmYLxSBjCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0RbCPIrbIwVAOcZRQzZwRgfQ9cn9j/Wms9N45tji9M=;
 b=OkYgAqnm2oViPTQ0baHjIKhosSFvDyh96rvrXVzu1isIGBlEllDOW71TAOGAa0VqDT3K/CR/GKKAEAdwUKUCvCKxYucCziHzNZRvF+M6oLCG1kJjqf/aESLNH4gSdDFf8Y21mwaSf61CLY1duc/ezV2SWhVLB1xAOduL0j6pdvI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by DU0P192MB2503.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 12:57:32 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:57:32 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Mon, 23 Nov 2026 13:57:28 +0100
Subject: [PATCH] wifi: ath12k: fix monitor buffer address TLV parsing on
 big-endian hosts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-ath11k-fix-monitor-mode-on-big-endian-v1-1-cff3255d15e8@westermo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAxFryJZN2BGO2ivUlyMTqpBzJQZEUG8e
 0NXj7d4/19QOAsXeFUXZD6kSFITelQwLUFnRonm4GrniVyDYV+IVvzIiVtS2VM2RsakOMqMrFG
 CYvesfdf2wU9tD7b1zWzF/+c93PcPiiypoHcAAAA=
X-Change-ID: 20261123-ath11k-fix-monitor-mode-on-big-endian-8506849a6c49
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: GVZP280CA0013.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::17) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|DU0P192MB2503:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8cf2a7-1325-4324-aa77-08df4961565c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261102130727099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info: CloAcPxa1XGrUoubpa2xDEg7FrNPXf0D89nSnPB2Lw5C32TFMuo8zqB2YgAelfv/XsuNPDwo0KSkcCZyqDe8YRTDqE8+dUz5WV66mbPEsUjKNZeYA3nJEcRJvvuxmiP5pTtFEi9HREPHMzxZK5+MTNxkOeHb+ab6/TFpJ8f9x8d0Le4PWGEWheWyFC/uv6emxlPPQ1wwlinYEroII/5R7VfNrGD+2jPeKXx+sbmAged1J1D5mdq5IJVRTYruAzMYSD4UxYKhxZ8/ypFNSUZjvKWWvACSxBqMCF61hWnyOAq4E/fNDxitUA2KnPo6gulcdh3v9XYWPebDm82FRsg1pYGIkHZZ12qiioFacCTJskJDdltl2A72G5lfxcJgiDZ71qKU6ElAVUbpyTrQzrmt5NUoVZzr2QIuftjUvvcYAmQQfEiHv/Q4RuK3s/52MC9PL5uRnZDpeH7pK5UCIaJsv1MekU8oeD7foADzlhaRnYU4YC/4iNt9L5/hNOx/CydE6ypoQhS4Hw+Oz3fiXSJa8i3mUy4SOUNUJ+WkFqSLKTaXlOyCn10D3sZjDNLpcelQlqvkQn+t4dDcx+csO1X9qeBm1KpMcxiiiRrFqRuA3Mj7UAyEapxJwkmiIxCPQ8/wZllXCr10oAtbnVvASI4vr7/aKQv7zh5DKNWopfmgacw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102130727099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um5IaWErenJRMU5BNDhmUExtYitTckg3VEovSklZTFdHbDZRN2dlNElpWjRR?=
 =?utf-8?B?ejNHOTFKM1RSMHlxakhqQlFZYnBXanMzRTNQZmdQZFRUam9SdzBoSnhUQW9G?=
 =?utf-8?B?RjkwZXp0Z3NBbmJqOWxEeFlDVE1acjVuRStpQTh5M2JsSjlKeUt1TlN4VkRF?=
 =?utf-8?B?TlVhNkdHNzNrYWoxNVJJZ2dVY3lKbWt2ZURNajRocGRjeTBwK05oa0VsWjcz?=
 =?utf-8?B?dHlWSXhuRlVESS9mTHVxRTdTdzlnR3dNMk5PNHh4N0YrT2llOXhaa3MxVFJx?=
 =?utf-8?B?eTJRNmx2dlhobnJMQnZWa0FZZXIybW9rU1lMeU92ZUNIWXJaQ3Jqck44Nk0w?=
 =?utf-8?B?dm1lZW84RzVBVnFnL1VwalR3bW9LRnYvRDFDRnM3MDJMejJveHVqQ0lZUGta?=
 =?utf-8?B?TE9KWllOVEM2RXo1UFVreFNjV0g4OTV1cHdHYlFUSGZIalJsdzV1TVR4UEVz?=
 =?utf-8?B?NGhUQytaaUJiMWRpYTE1SFk4TlVUSWg5ZG05aTlkcUloaU9Nbm5vMU1SejZh?=
 =?utf-8?B?c3lkQjdaL0JVY3B1U2sxVXBoR2oxK1ZxUlVWWFZVMVVMbllXTHgyK0k0Tmor?=
 =?utf-8?B?UnhZd3dGQlA4cDlsc0I5aXV6VGZxazhsRjlPV2w1V0Fqd3l2azJaVTREOE9q?=
 =?utf-8?B?MDN4bnIwZ2E4MmkvS2FEZDNQN2RNZjFYOE9wdThlcGJ4L2JrR0tKc3FhTlVB?=
 =?utf-8?B?YkZlaG1BaXIyNWtncTVvc2J3bTIzNSttdnoxVGhmVUdNWFZqVHBKV0ppUWpC?=
 =?utf-8?B?UlE3S2huRzJqZUF0MzQ4NzFwVzFiMkdSR3FEVGV6M1pJZ2lXYW41Y3Z5cWgx?=
 =?utf-8?B?bmlld1JUMXhiZGJjSHgrTWEzcXdDUHdvZ01MSFNSZDd3ZXd2RUlzaCtmdGJi?=
 =?utf-8?B?TUwyeFptU3phK0crMzAvWWZiMTZSMTExbnNPRTBTSkg0ZkNEa3RSYklkdHgr?=
 =?utf-8?B?emFWUkFHNldkSG9HUmJKbWlPWm81dXMvZ0ZiYUlIVWxkUHdPeFlsMlRldmI2?=
 =?utf-8?B?WG10WGROK3JCYWlnOVdpQnlNR2hsVjVUTVhKbW5lNDNGTVFzdHBUUUpNU3ha?=
 =?utf-8?B?V1M0ZVUwNnZUTXNWR054YWFVTmtINEhIRE5xRnlqdUU1QVNEK2prYzFiVHhD?=
 =?utf-8?B?OXVBNDRRNDhIV09TTEhHWWNjRlArcVVqcE1MbHRvZDBidS9yNk1UTlFYcFlC?=
 =?utf-8?B?ZTdFQ1VVa25vNmpmVk1vNURrbDBzODVLaUc2RFRVdUhyaGptdXFDZldSZG1S?=
 =?utf-8?B?QlpyZDZMNE1WVGJkTTQxckJOdEUwRVdqM1ZUZWpXR2R6emloc3k4NnU1ZVNP?=
 =?utf-8?B?S3JDY096blo5ZjVnNzlhOFNZd3ZyRVJSSmNSakRCUjFtUHNZMEZGaGZ2UG44?=
 =?utf-8?B?bTh1bThmZUJjQi9DTXRYWG01ZXYwS1c2alUzQ2xKRnZFRklFeWY3bFVKaFYx?=
 =?utf-8?B?eW1YMXhyNHdRS1h2MzJ3OGxvelpJYzNpOHhHVlRkalB3WDh6eUIyc3lGYlFq?=
 =?utf-8?B?VHdYUkZqVFJ3ejIvUE1PTGc5Sm50WFlxOCsvTVVCbEV3WXNPemxzM1NDayt5?=
 =?utf-8?B?ak1nVDhzdlBWb0J2cGFmWUZoWnc2dzdrUVNRd1l5dXAwaDFiZHE0bHA5RlBK?=
 =?utf-8?B?djM1ZXpSUS8rMjVyK08vd1lEYTJWMFJ2YWxpYVVtSDUwaHNiN2NTK2lISCt4?=
 =?utf-8?B?VXR4RlplalNXWDBUTkFYdUJ4RUdoYlpYYkNRZ1ZES1hoRDZQLysyMFZlbE92?=
 =?utf-8?B?ZG1JaldDbWRRUnoxaDg1VXRkNUdoL2pVTGJESDVEd0xNU2tkSHJzalZjWjNv?=
 =?utf-8?B?MkRlRmFhTEllUUV6NWs3aUNVYWNEdGpHUi9LYmJxTnVGRUFteHV6TDdVTDBC?=
 =?utf-8?B?aFVkdndncXBmU1ZEZ3pCS2REbTFWeG9md0lrMXlBa2xVL2xSbk5MRFR1Z2FK?=
 =?utf-8?B?c1BuSzRERXdsMGNNcm1XTnFjalZHWUw1QzNNdWJFMjBCM2xhRFNpbXgwZEZL?=
 =?utf-8?B?RTlGOGxBdzBDN0VKRGQ0UWwwNG9PNjVkRWNqcjNyS1NrWW1Hb1RWV2N0dk53?=
 =?utf-8?B?WkZwUGxxVHFhMm4yekN3SlNLSDJ1UWZUT0N4K0IrMHdhOGZneXIvd1RwSFZT?=
 =?utf-8?B?VEI2NGFNQ2RUQjlSZVN2V0tmVlo2OHc0T1Erdmh2KzlIa1ozaFhFRlhrdEhu?=
 =?utf-8?B?NlVDUGkvdDZFSTE3NlJabFVPbUFjQTN4dXN3NHk0ZktrRU14ZEZtY2lOT2hV?=
 =?utf-8?B?V3ljMXBjMGVjM3NoVVk1emxYWURPYWJjWnUzc2dRdWJEQ3FFQlFXSWVOY3V6?=
 =?utf-8?B?WGpsUURWWVZHcnlQWjBpOExBckp1cllyWDVEa2xud1RPblF5TE9mQT09?=
X-Exchange-RoutingPolicyChecked: hdE4iLqF2dMBdVHBev0oLxmk16a30SgOMo09VueWjtQt5X1JN9NvG59i7m599dBj9ey69udL1QEtl59SbUDroKkyHdv264UjPz246beviuy+mrU0jaBprETPiMf0l/Uem/TcGi0vx/ZxcE0zgqhL36GnnxRROBDNST/tEXJIbFoL4Ln82HMxOGtQidYh3UkWWBiTSsgGFK0n45Yueq8RjskB80hhNXbqrkqgMBmM99fzc7Geu58uqpKDEeglKOZCAVkKPSD/LMQgrYgVZUdaK5imBOL/ldNZ4uFRyODSHwHiDIxWBD+ygtujQskjsOWaqvdS0JPwfRqZQZBffLIQQQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +cGB9zWc03YfOsRdPbwVnW/S8exQQlpdzL5M6qw1OvG+669UDgfk3L8XvqGb0WAKnkrSAiLg+iHV0UvH2wpODLNSEFqIJg94gqhemjxtyKsFW8Qb++T7TtgWOJrEeiOdOiZb6ZUWc+X5aWbAI56vi5LqW3x2wFzSyQyDo+ziEq3znebP3NCKODoZ1PCI03HkU1nUC5QXJkIXBmul7FvuBDLK6CMBWi1i0UhnT30NWqqodtqc1nXlzpkSNzsoNRs/h5QuzSoBeulLYV3TDwL6FHbrTm1hz3erRDXNvBEd232L4RRENBpUUXwzXGeU09llc5CuOHJ9Fusj9lKvwBmQIqTMGdQNIggatDx9pHq6DMeBReM+oCj5sLxNLgadiRRsyK6wR1R5pn2POpzxLV/g70TnkaJ1awajGhjHjX+umTF+Tzy+d18Vvqn7T2K3vw1I734a7gl/Olz9o/5Uqf9tZZroHDs3NdWhk5q8YkdGttPH/nScbAqrP1ZLswEO1sVCpLdyCtfjepH6uXnyDeXhNuNc1Z+YvKa86tKM1pqpTLxbnCHOE+QLSKVXcIuy5EQgMNo7qnpJ0WLgoPwybYqLt1SC7thirmVmhomo+Vv5S2Nsmd/iyP2ial6R0CAlQLm/
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8cf2a7-1325-4324-aa77-08df4961565c
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 12:57:32.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6cYBP+mhy3iDg0LdOyNwdL6Pc48BR2GaA4OgiJa4nPbxKCpDZ9dyUKXkwZeOjAwD6lmbRwSOlx6TjLkBgZm8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB2503
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission: 
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: DU0P192MB2503.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfX0X1mvgSqJitG
 GfI96mJCwH4+sqek+vhJoiIaUNg8ea/Z9ycM8s6eIhnPbI7yytu0QVN/cjEtT9a0ax/q8OD3vmY
 LY5zyP3arKdBdJaZK0PaIRFCrwoNm0w=
X-Proofpoint-GUID: LI2GMmwRU11ZKKmp4K2WIoc-rdWl86Dj
X-Proofpoint-ORIG-GUID: LI2GMmwRU11ZKKmp4K2WIoc-rdWl86Dj
X-Authority-Analysis: v=2.4 cv=a5ClZkSF c=1 sm=1 tr=0 ts=6b04383e cx=c_pps
 a=0VTmEJu8kJrSWnrl2fAwgg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=m9ZdXks8iFv6nztToqYA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfX1jQZbE5/3jyp
 2aNfV1k3yaEPPpj5sxq9h5YVElBbw3Ve7jv7t2u4ZzOsPyHpUVj6zQUoMP9hi1uGrDFOzfnVB18
 vT3/hY8Po9RwBvX+x4+CWhczBiWpx2WYrzF9aAJutc9a2tRujv8bP9KazGbdlxd3QWOkVu2tdpz
 kv7I8BtEcyER19CLXBW3ULjM2prM2fXK/CMfp4vf3/DBXKycC9B1Udmm99+pf6mkFVDlV7ijH8V
 dO92Z5Dh7AWDhaKk9NBHq8wGlZBQ2kVx9GTXpdmDmqNaXm9lDlivCpWjA/qM6D7agSHGi0OwQnb
 NNDkmJXYCrVC1+K4Afp91k1RbCSbYd3gTHcLeowl59Bds8GRJu9RJyQbszR76n5mG8bxDpf6Laq
 0toL8JC6sdExvYybNjiwmvGWo0vLOW35QFayHVH9kMVFpfUaLdyS2ZtViv8BfBYZPgFpiX0YxOe
 ePx0Bh1G9fNsoLXaofw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_045747_678433_E65F4EDA 
X-CRM114-Status: GOOD (  11.12  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_wifi7_dp_mon_parse_rx_dest_tlv() passes the value of the
HAL_MON_BUF_ADDR TLV directly to ath12k_dp_mon_parse_status_buf(), which
reads it as struct dp_mon_packet_info. The TLV consists of little-endian
32-bit words: the buffer cookie in word 0 and 1, and dma_length (bits
11:0), msdu_continuation (bit 16) and truncated (bit 17) in word 2. The
struct however uses host-endian u64/u16 fields and two bool fields covering
whole bytes instead of single bits.

On big-endian hosts (powerpc64) the cookie is read byte-swapped, the
resulting buf_id is invalid and every monitor buffer is dropped with "mon
dest desc with inval buf_id". A monitor interface does not receive any
frame. If the wrong buf_id matches a buffer still owned by the hardware,
that buffer is unmapped and freed while in use.

Describe the TLV as little-endian 32-bit words with bit masks, rename the
struct to dp_mon_packet_info_params as it represents the wire format, and
read the fields with le32_get_bits().

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c |  8 +++++---
 drivers/net/wireless/ath/ath12k/dp_mon.h | 15 +++++++++------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae14e118fe36..ab806e93843a 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -538,7 +538,7 @@ EXPORT_SYMBOL(ath12k_dp_pkt_set_pktlen);
 int
 ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 			       struct ath12k_mon_data *pmon,
-			       const struct dp_mon_packet_info *packet_info)
+			       const struct dp_mon_packet_info_params *packet_info)
 {
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_base *ab = dp->ab;
@@ -547,7 +547,7 @@ ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 	int buf_id;
 	u32 offset;
 
-	buf_id = u32_get_bits(packet_info->cookie, DP_RXDMA_BUF_COOKIE_BUF_ID);
+	buf_id = le32_get_bits(packet_info->cookie_lo, DP_RXDMA_BUF_COOKIE_BUF_ID);
 
 	spin_lock_bh(&buf_ring->idr_lock);
 	msdu = idr_remove(&buf_ring->bufs_idr, buf_id);
@@ -562,7 +562,9 @@ ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 			 msdu->len + skb_tailroom(msdu),
 			 DMA_FROM_DEVICE);
 
-	offset = packet_info->dma_length + ATH12K_MON_RX_DOT11_OFFSET;
+	offset = le32_get_bits(packet_info->info0,
+			       DP_MON_PACKET_INFO_INFO0_DMA_LENGTH) +
+		 ATH12K_MON_RX_DOT11_OFFSET;
 	if (ath12k_dp_pkt_set_pktlen(msdu, offset)) {
 		dev_kfree_skb_any(msdu);
 		goto dest_replenish;
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.h b/drivers/net/wireless/ath/ath12k/dp_mon.h
index f352655eae9d..6fffea1f284f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.h
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.h
@@ -67,11 +67,14 @@ struct dp_mon_frame_min_one {
 	u8 addr1[ETH_ALEN];
 } __packed;
 
-struct dp_mon_packet_info {
-	u64 cookie;
-	u16 dma_length;
-	bool msdu_continuation;
-	bool truncated;
+#define DP_MON_PACKET_INFO_INFO0_DMA_LENGTH		GENMASK(11, 0)
+#define DP_MON_PACKET_INFO_INFO0_MSDU_CONTINUATION	BIT(16)
+#define DP_MON_PACKET_INFO_INFO0_TRUNCATED		BIT(17)
+
+struct dp_mon_packet_info_params {
+	__le32 cookie_lo;
+	__le32 cookie_hi;
+	__le32 info0;
 };
 
 struct dp_mon_tx_ppdu_info {
@@ -104,7 +107,7 @@ bool ath12k_dp_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id);
 int
 ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 			       struct ath12k_mon_data *pmon,
-			       const struct dp_mon_packet_info *packet_info);
+			       const struct dp_mon_packet_info_params *packet_info);
 void ath12k_dp_mon_update_radiotap(struct ath12k_pdev_dp *dp_pdev,
 				   struct hal_rx_mon_ppdu_info *ppduinfo,
 				   struct sk_buff *mon_skb,

---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261123-ath11k-fix-monitor-mode-on-big-endian-8506849a6c49

Best regards,
-- 
Alexander Wilhelm <alexander.wilhelm@westermo.com>



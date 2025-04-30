Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455B6C369D9
	for <ath12k@archiver.kernel.org>; Wed, 30 Apr 2025 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWoiAYeOGvtEHJtrNkG5Os3ZCeOUPYvyt89z2yi96HE=; b=cFj1lzHRlNTkY9SlWgptIM13gj
	D5/3avwUheFk7ezT2Nb9NM2AgoNQSwldX3feVtT/3c4ehLmSwCNCHH/IeyhYWwm+WLVw6GtQn02Md
	lrwYnZ5WoZaPd7wr64AwPkm0fbGfIHOP3JJQaCPHqihp0MYQSgtjZYwxUaol5K+7b+LUOZCOCrIRs
	B7Rmh7UQzAs+ewzPnNgp23IMpqscxub+HhMPe8qxcG0cIfYuZSvCiGdZ4RFNJBByGmFFNkXIkMxm3
	bMIYbUcsZkwbuI4aZVb7EcvVgMxJgGjg/U1iVEJygFEvPkfZjB9Dfgk0hLXEdanZc4aNmpCJujO/Z
	NeDILYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6ts-0000000CsUZ-3pDF;
	Wed, 30 Apr 2025 12:50:56 +0000
Received: from mail-db8eur05olkn20803.outbound.protection.outlook.com ([2a01:111:f403:2e14::803] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6tq-0000000CsTc-3CrN
	for ath12k@lists.infradead.org;
	Wed, 30 Apr 2025 12:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAtxNn2kUq0tkKyxNZmP9qy4GFIRzqYY2SLTPv7l51MosqXCi3ENohFEEtN5FOK02GqnH9qvNoSYS6zhVEoaSoOMxwVTfhVUCquCxSnr1fzOdWcAzOqLdz0FuRUanDyzNAA2kJ0e6GjJjCV08QbLfDMBEwQYnx7Kr5LBy2+meeU7iSSmFUtbEAKsWuZrF2cO7wjZ0xZFexA7Ji9mh2PRR1xe9dg5YGF0LIB11MsbZDhqk+l8z6q/InmIkEw1aDU/BZEnTvGuYyLK23gXrnLZyT/AY0oXm6/ihedJvBzar0L42WghbllqRZI7VFQwQaHpe2H4f2eOJMhtZ+yoHgo+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWoiAYeOGvtEHJtrNkG5Os3ZCeOUPYvyt89z2yi96HE=;
 b=g2N7Gk9b98p5ip5lPC41XyT7ly7qfrkRsPvMH73OSQP8l5Zpbk6Max1MmByWwEOhyzF6AWrGJ8j/5lLG9GqtE7HYVrVDNQGB7pULkDELmjcbsS7CtPMm4W3WSitIwIEX9xh1SQbmcRoOdjNIKG4SNMwxp62Z5CI2t5xJqRfcCdB91XrT5CWBDqXIVp1O+J8z9oj2KlWskC0A0FOmu0uA8IJN/EmrO9gGly4//aZ0hs3J3LGLuwRZqMxtCGrKxZi3iiPjjQTuttJe8U0GsQ5yGxnA/47HJrpIGMQcZF9PmWmt1LExzFbshGl2BZR4uyTPqxWxzj/TziuM3t7d7tX/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWoiAYeOGvtEHJtrNkG5Os3ZCeOUPYvyt89z2yi96HE=;
 b=Rx2pD0MDu2J9MHHPgRC+7AkXMSe7wuYN7Bv085Gst+Vlr6rqsHaveFEbwWJuVnhP/lBhQl/+Bh7UUNlPCAhW4MDg+TNk4wNK92A8eX58Y1WZShLVGQlEQPofg2OumY/ospqC+lq/UXHoP6M++W5Cg5lN4Glk+nVDOgi5pcogY2E2/rG9tDxdvjpeEUI1G5Cz2bSCe52gaQlVeyGsGBJFo2F66kI41upCDIZokR+PU1FRgLVkK3VFglCW3v72iByv43+GUHEVC5D0V/IAIRLXTVsPVzGkuDOGdkhWZae+VGKafWd6Ys4nnqgFQrvkzqI2LHH4qfMN5ZMl/3++BXgohQ==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AM9P190MB1314.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 12:50:49 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 12:50:49 +0000
Message-ID: <AS8P190MB1205E08229ACF7607841B4EC87832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 14:50:48 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <AS8P190MB120554CEB603837E6A45DD8587832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
Content-Language: en-US
From: G <gregoire.s93@live.fr>
In-Reply-To: <AS8P190MB120554CEB603837E6A45DD8587832@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0190.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::19) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <ff41d5c9-c8b8-4375-801e-828e2dd8aa13@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AM9P190MB1314:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f3b349-b056-470e-d1b3-08dd87e5a1d2
X-MS-Exchange-SLBlob-MailProps: UDhyqGRoB4b889fVhRJ2YOt0YVQIRbgU2sksP/nSSYow128pA1DvEAnL11wySu/ohj2hmp2EKPOCgrFSy2UCOLGNrUS6ObpA33SnoiyeHj3y2ebsFW8hsgLqvQ+qcLr6weuMt8QyZHHZFDEOFjt6LRFKgEjeYPE+Ni+XDMVoZtCAxjNP4Sm//Z6i8lBQ/icBnS4qyMpxlhjRw0YNpenLHAKIL5N30We0IOuAmgAbUIRwuNTl2MHpRbXqTnXOmsJ1bjw2fvzY5eM8Si4dWmLFKbmJUVMHofh8kjbtGYsoE1iB7VC2v4Q588GUza2Fa6Pn4pXf92WyDxGJPigSa/TF9tWYKr5YgATWIHM8eF80pajtOlDLATDQTJH14lvK3vx3ZOKxVWvhXgmzcRs2VZhmNRbmnGd0kVmJjihoWQZ/HD4qzjZ0tA2GP8gzZ+XL0kJ+mgLa1UsWjUfIotNYZQyExJ4lXXPGqNB8DpLaPVnPBZSct3NflV6JzYFfwrunFKaHKktjQMYnTFgYyUCX33BXCCiBNOnhhTYeMfYKEBAk63cLoBXK7SZbz9ov+1lCOlUKKplapZOryOA16bHeLnB0Pb1MBBfz3TNKUE9q3qQmDb2CeLwcYfDr54F1r09YXv6huglVcB5QrEzcDuvvYAKF+zJFC+eb68q7S9iW9WxrpUJblPU3oT38sA==
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|461199028|5072599009|8060799006|19110799003|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTJpdTJwdWM4akQxdWcwNzZzZTJUWE5acFJWQUt6a2dlTVMwZGwzQkhlaWd0?=
 =?utf-8?B?RTl3Z1BWMUlEKzFlYmQ1NWdKK29nRGxpa0pJQ2liR2ljSHczdEc2Mk9lQ1Fh?=
 =?utf-8?B?WE1SYnBEVjBlR1c1Q0hSUW9JYjZuNEhYM2E1VjJwVUFScm1vUmNpTkRnc3NK?=
 =?utf-8?B?aEhxNjltaXFtVU5tOFZJRktLc3dXKzdRWnBRRUl0L1hOYU1NOVdtL3FibDRJ?=
 =?utf-8?B?RitrM29DVmhsRm1ORTlZamhBMEprTTkrejdZVFlMa3BkTmg1N1lzRlRJTWpj?=
 =?utf-8?B?ZXRqdnpZbThCMlJ1bjFOVG1PNjQ4Q2IwRUhOa1QzTVFtOVlRK0s4REpGSTky?=
 =?utf-8?B?bDBqMVFjWEpjdGowdU9QRldMMWZVU3QvS2dqZFpuZUdkbFVQczFNeW1Wdkpr?=
 =?utf-8?B?NGpQemg3L0QvOXNQMVd0bGpTd1RaNFJsL1c0UU95QjRtbXREMFdOd0VMVzVL?=
 =?utf-8?B?RjRKWERja0lOMFBhN2M2UHJYUFI1ZXBESVpiT3AwcUpVWXc1RnhMaTBjZHZL?=
 =?utf-8?B?MkFSWms5M0Z2WTQzQjh2VVh4di92UGs1ZVBwaGNwSUVwTE9aYmticzFjSHMy?=
 =?utf-8?B?d1RrLzZsREN0Vm0zUUF2cXgxTENDRWJmbWxzQmJGaXBZZVJwM3VvQjdtTUxm?=
 =?utf-8?B?Y1VoSWkzbS9WQ0xNTXdPbytmbXdpc0I5VXRReFhaS2twR2htL3VRUVlqWE50?=
 =?utf-8?B?NmN2ZnBrR043SEo3VnBmcFlEdy9SYlpzZzBWR2ROdTZNZUdIVFd0a1BxZ0xj?=
 =?utf-8?B?ZmNqSnNlQStlN1BTa0gzc0NOdmZjRXk3TlJCWmZ1aHJEOUt3dWJCYVRDcTRz?=
 =?utf-8?B?dkl0TXpkaktGamo3RjV3KzR0MTJHKzhXVGN6UHN1eS9CWjdqMW9UNkNIZVBI?=
 =?utf-8?B?cm9FVUljYVZVRytGeG1tM0Z2emNueUQ0cmFNR2tPcEVPd1BUTS9mT2xFZGs5?=
 =?utf-8?B?VmJ3d0RVK1JYNzlsVTFUQ3ErNHRLZ3V3TGVWOW40Zy9Nb3Boa0ovUXhtc0p5?=
 =?utf-8?B?RnRYSTUrMGE2S0o1aEhKVlZtWHA1RXRxb1NJdnJHQTZPNUNheDJ0ZUxGVWhI?=
 =?utf-8?B?eWhkNTZnbDlDeURLajlOelNoRWZEaEowL2pFS1hlcHhxVXM0NDRwVVJFVzZS?=
 =?utf-8?B?MndvNEozc0N5UDVPUEhTMnJJblJnYUNveFRTU3dSZ2pkeGdJRndLUVZGa2F1?=
 =?utf-8?B?L1M0MHpBamh4K1gxNGxkVmJVdHFLajhNdHFIdGxJdDZlRk15SHg0dVlEUFBl?=
 =?utf-8?B?U1ZMbDBXZllQSFJZMlhNaHgzMEgrNUxxVVhJcGdVdXZEaXFleVMwNEtFZEE4?=
 =?utf-8?B?WEoxVDVta3BMTVphQzJUMVNCZXFLUDdmbVhaUVF0VU5aWjdYb0tHQlJYMHdU?=
 =?utf-8?B?NklyUUJ1VnJaOExnbDhCN0NIMHlTWGgzYmlSdkVVWTlPdDZ3ZUxBdWRsOFk3?=
 =?utf-8?B?OWtlWWNIdEF6UlF6dzB0cTJxazgrTmJzSERtMHA5QUR1MTh1MDdRRWJiM2sv?=
 =?utf-8?B?a0lBWXU1WGpOa1Z6TVg2NWFjblF3MTZ5d1JTSUc1QkgrU1ZBSkpRcXNFYzVR?=
 =?utf-8?B?V2RwQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elpjNnBEUWNoOGV2cWZaREdabHR6WmVKTFljaXVjUFYzdHpKb1IwVXB4a2FW?=
 =?utf-8?B?VUVSck9HbEpaWWZHZ01zczZXTXk2MDVRa0hVVVcxRHJ1U1lGM3hoM3Q1eFJh?=
 =?utf-8?B?bWZPY29LaFR5ZEZ6VnByWkpITUt1MXZQeDJkNXNCN09FQkRsamo4RXJFS09C?=
 =?utf-8?B?U1dzaHl1OGpEYWZnaFV1SlZpNVB2UmFsK1BjUDdtRVFqWGh1SlpMbUF5b2JM?=
 =?utf-8?B?djVnb1dPUksvN3piK1V2QkEydnpSTTU5R0w4cU5OeHM0bGlSc0owYkg1bGxr?=
 =?utf-8?B?ZzVYQ3FhY0Z4U0o4dGNpZDlXdlNQaE5RMVRFakdCK0lTWC9lQ1hFM3FzR05G?=
 =?utf-8?B?dUw4V2t4cTVrS3N6M1NiSmJJaFdBcmdXUmRNTzZPdEYxRTZCSndENjduVlVa?=
 =?utf-8?B?NE9IYXp0QjZqL2dnWkNqVXJnQWh6a2hsdVlaekNmQk45OEExUHpKOExtTHJz?=
 =?utf-8?B?RmNMNU9FK3hqYW5tYThnVVcxNzIrMytSbmp4ckJuRTRkZHlWQnF6ek9XL0lB?=
 =?utf-8?B?YnV2Tm02cml4dFY0REVqYTNGYUVzb0pDbHpTRDJBQVlEaHc1ZWtIdjlCMUZx?=
 =?utf-8?B?M09pNDFWbGNJK2xUaXBOUE9Bc1FCcGE0endXelBGenlMaFMrOFdFYi9KYitS?=
 =?utf-8?B?NHJyOUFXOUdJU0R5SjNGMGxiVkkxWHlKN21ocjI5REVrY1hHdVpRdHRRcGpM?=
 =?utf-8?B?bUlmaFBaUm5hWTJJejdWL3A2SDIwd05aRThicy80YjMvTW1VZmtSaTc2ZVJ1?=
 =?utf-8?B?U0NaNUVNQm1oWnJjVE5TcklWalFGYW9pZjdBRXUwK0xreTNQNW9FSFlaY3Rw?=
 =?utf-8?B?a2t6SXpJQTVOTmpYSGlhTnBibUN3R2VySkdydGpDZGYvbkU2N0R6NHY3dUZz?=
 =?utf-8?B?c0w3TEo3TTdTOSszRDhNU3JadnRZMW0rcU9aK2ZCTk9Xam9NYmVQU3FSTTVh?=
 =?utf-8?B?NjVCOXI5YzlmZFhxbE5YNm42S2RoNStxSk01V3B0R1Q5eGIyUkJEK3k3L1h6?=
 =?utf-8?B?dU05RUpGNld2dDdnbkpMWmhjcU1qRzIwaW5oWkladUdKZU1ZZ2laL1Rna0Qr?=
 =?utf-8?B?Q0ZkMjJTMEpUU1JhZkxaWjdXR2hZZDRYQm5CSGJZWTRxNWhxUkgwU0tEY0Y4?=
 =?utf-8?B?NTQ1ZUhkeXloQjdCSXhyK1VQdWdHWURsTkJ1OFowRUVVam5oOENWbXJ3L3h1?=
 =?utf-8?B?dFoybENBSW1sUTYxSTYxanNEVjltN3ZGN3Z1YnVVZ2lHcWRBck13THA3OTM0?=
 =?utf-8?B?R016UytKRDl2bnRlOUpTUmhEZEVUelppL2krT1huckR2c2pWSXBrTXBmTEQ3?=
 =?utf-8?B?NzRCdFNDREpLMnQzVjM4RUs2Smd2SHBsNFRHQndCTFA1YnBlY2V0azltWjNh?=
 =?utf-8?B?TUc3MUdkMmlhdVc5cmtlSkN5WWk1WkFmcmUvanE1NVJtZk95NHc4ZmkrZ1Mv?=
 =?utf-8?B?T0tkdkM3VUdnamhCQysrQUJ6U2FFRzEzYy9DQWYwZVd6N1NBMmNiZDBKbVly?=
 =?utf-8?B?VDNmZW1WWVB4cUxRbit3aW9mNG5HS2hpWGVTSjI5Y1htcC9LeGUwOGMrSURE?=
 =?utf-8?B?d2owTGNHV0krRzFGSVJ1VXk4QVBTQnlFMW8xUk9vRWltZW9VVWFOeFQ3UDNz?=
 =?utf-8?Q?yU+GmxcFVY1r6M4BXWSevpfdOgg0GebNlmY58IWWB1N0=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-4ff97.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f3b349-b056-470e-d1b3-08dd87e5a1d2
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:50:49.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_055054_817227_A887FEE3 
X-CRM114-Status: UNSURE (   2.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On linux 6.14.4. Maybe I also need ath-next. I don't know


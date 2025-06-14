Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DC9C71141
	for <ath12k@archiver.kernel.org>; Sat, 14 Jun 2025 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:References:To
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcqbBVYk61MN99WguvDZgQDOx9Z1hHoEnaIgPLBOTlM=; b=Rq8gJrkkfYMJZ0j464aQLAdfdN
	H2SHlY3tVj0Pd1+S1fSgGGnN2ntT30qL10cQgt3quzV/eHepTX6oGIoY5+n9ZFJTZmwiO5Lf1loeM
	CYYz77VwsTgHAVy+DbRH3Y0ZjX+dEDKJg9vdOqSjwdz98sWINET3rYCdTUEmnom3gScaL7+9iq+CB
	iQoPIj5UwoLFWsDYfF0exqHbF6vyo31D48lIiqOLU191YNSNG7H9CTpWUqUcOOwUrE7G9PlWZA+1Q
	ec+bjpNdNBtIAe3fUMIzYoLqX5X6mpj0MPxyywiiahVcT4fR0hBei3v8lesQvRa7OJHasmVSMSEgL
	26UegUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQNcN-000000016Oh-2BwV;
	Sat, 14 Jun 2025 09:56:07 +0000
Received: from mail-westeuropeazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d201::2] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQNcJ-000000016OK-0IYz
	for ath12k@lists.infradead.org;
	Sat, 14 Jun 2025 09:56:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxB2P1Hs3AGJq+hX18rVQpu2XUk3r6C1UNQkr+R0pC/owzQTCK1xOJzfdpHVPCMEx/z7uyQK0yOWCS/3iAVLxQDZi4cYOdMttbjpT8fR/HTMD+h3Fi5WFabmHMCkC2YY4UifmF/w7aaBTEIkuM726kX5GlscQQNlY9/8DYb4gUrQiUvb9+8CE+ovoe5dd+Aa9/EWCnrV8lNnCBE2zfmaE3CvFq/oA3+lCtoi0uDMKl6hBhXPrSUmCDiT39BigZ6BCHWCzJydiKz2+1YGGJQTPwj/Gu9qx0/LdWZNvK3s9eF5OeBFrln7YcIEn2LN+lG4AsCpWXvx/QGMjReNpJ/E2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcqbBVYk61MN99WguvDZgQDOx9Z1hHoEnaIgPLBOTlM=;
 b=JUnbyl7+z1zKSsXu7+rjgRVU6qoUATDqMVdr4QuL838m9iqJ7efplRbEV1tLCyaH80y3w7db3wkfeE8sptf/nrzzn+wf1ME1nwlC+N1yoob6gJtMZ1WpZJN51P+lEW8pQVrRVBMSCeaHRZvjoUHZi1mZCU03QLmODtCzMJxCzQ1ajvloFavYpDCP78wzqc2TjfzdkUlNv9kPikNjVR7qXB6IWtPj70tCfLPK4wv5VAHMYJhh0Nl0BjbpPvuoff++dI8Y3EXtul+wD0ItAof2gI+6P02+iPJwlaPbg2uuMjdNo07Lti6mxUeS1ZDIXu0esKpdzVl5AsTHz98ikavcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcqbBVYk61MN99WguvDZgQDOx9Z1hHoEnaIgPLBOTlM=;
 b=X9nL53opGOmkAnqmQKcwghcx2g7DiHvOd+ZkistKFrz0HF7HLp8zl1GSkZN/BmEdpvq8x9UzTQwY3hO7S+z5h2k8HiUXpmFOAHt5TMi/fOZDBJCUM0vpmj9PjO209fxcez4ouYBdlo395mBe7S24HlDeztwU6ga+qNdPlnB1WsrXXduhCFegJUVZd7PCxrn3wj3F8BgqYMy4mdUvlQkHAubyYv7Vh7BiI5OIhcRsEgQ+7lOQzvj3HZlpOtTEvhV42iI+p1YhkgDP+nG4ABFHtG4sw27dFnJco6wLJr3ybZcAvpvZz9Vm/1qL2AgpbXd8ucIgo5cUfEgWW1SSZ93ZDw==
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2eb::9)
 by AM0P190MB0771.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Sat, 14 Jun
 2025 09:56:00 +0000
Received: from AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99]) by AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 ([fe80::ac68:f0d0:92de:6d99%6]) with mapi id 15.20.8835.023; Sat, 14 Jun 2025
 09:56:00 +0000
Message-ID: <AS8P190MB1205AD271C0137F481F8B4598776A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM>
Date: Sat, 14 Jun 2025 11:55:58 +0200
User-Agent: Thunderbird Daily
To: ath12k@lists.infradead.org
References: <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
Subject: Re: pull-request: ath-current-20250608
Content-Language: en-US
From: g <gregoire.s93@live.fr>
In-Reply-To: <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0094.eurprd04.prod.outlook.com
 (2603:10a6:803:64::29) To AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2eb::9)
X-Microsoft-Original-Message-ID: <c68f4cad-bc76-42e5-bd9e-dc21d19cdc54@live.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P190MB1205:EE_|AM0P190MB0771:EE_
X-MS-Office365-Filtering-Correlation-Id: 71203875-0849-4b59-ffd9-08ddab29aa9c
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|5072599009|15080799009|461199028|8060799009|7092599006|19110799006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnZFdE4vVkZ1dnJINDlEOHBmQk5Kak5LNGxPZ2xTUG41aFJyTUo0VnE3c2xT?=
 =?utf-8?B?SXlrdGJRQkpDRzJWa2R5OXlWR09yN0c0dEdXeFhtc1F6ckJ4VWxQRVhrRFdW?=
 =?utf-8?B?TG9jQ0JUY3l1WlRZSkI4d200ZERBNmNEM1RIK1FpOU9FbUg4UC9YRnJ0UjZm?=
 =?utf-8?B?L0tCTytRZHJnWjVuKzlwd3U1VmxLKzVTQ2d3UzZ5dmhCU0hFU0lNTDUxNlVX?=
 =?utf-8?B?cnB4a1d5YTVSYTJ3WGEwaWhucTFJRnhCclZTQ252ZWRnRFFrZ3k5OFhPNnll?=
 =?utf-8?B?cXJzdEJUUWFlY0lNWHVIUms4SlE1ZUk4NlRDNVk3SmxhaU4vbzM3cW5nYjZu?=
 =?utf-8?B?QkZqVS9xVHkrTDlwcjRMQ1VDZGFGbVo1dHkvdGtuSTY3TzF5NVgyMk05VjBq?=
 =?utf-8?B?WnJXeGg0V2dBTGxQWHlOMFU4RG9sdmlrWjdpK2ZTdC93ZzBucG1jY2ZxRWFC?=
 =?utf-8?B?akRsWWorNU5pNUpRNGZhZkN3T3dLQ1hYYzdOZXhQMGZ6Wldab2F1b3puUlhw?=
 =?utf-8?B?RjJvZEllZjF1TEovVnNad3orRjhkeVZYY1RHYWdyRUFZTThOU2VvVVMyNGov?=
 =?utf-8?B?R0J0bENJRXhPV09RRVoyR2VJaG85SWlyRTZKNnJVT0czdkdsVDF0ZE1yT2pM?=
 =?utf-8?B?NFJ1ZVc0cWpvZU5VNVU3VGowL3V6S2tqMkl3YzVHeE0xZ3VyaHFZZUhQbXJm?=
 =?utf-8?B?MmNBMDZmTGFCUnJ0Z21RVkFyeEdmdzFWZXV2b1dUSE5USndPS0F6SXZXNkVs?=
 =?utf-8?B?YkthZXFzdkRSOFJIcnFQMWFyTWUrUHpRQ0w5ajEvd0xPNGJmTDN4OFVTVTBR?=
 =?utf-8?B?Q1ZOeEhHeXZlbWNQYjh0REsrb3kwWVdwbWllVTJFSHQ2RFhEZWpGbFBBRUVz?=
 =?utf-8?B?WjVCdTVzTHdLTzJOOXdNYUoyOUJQUTRUZW82dC8rTDQ4YmtuaE9oYUswSDJw?=
 =?utf-8?B?bFI4dnJseEY5Mmc3a3NoQzR0eHhkSElpK0FYeHorYkdLaW1PUUMwR2dteTFx?=
 =?utf-8?B?UXE5SnpwUldvSlhyQTYxUEMvT3A3Wm1TNGpOYU9QMHZ5S3RWSlVFanJUN3Np?=
 =?utf-8?B?eTJDR0MxN0pEa3FCR1d3OVBDUUVPaGR5OVUwc0wwM25uMkNGamU5UjloRzN0?=
 =?utf-8?B?Y2xYbE9hUW5zRys0aWNTUXNIQWo5V2QyN1VaYWFDblBLYXFUcjRJR3pYUUxq?=
 =?utf-8?B?dnl4dXplZWIxVmxDNWhmKyt4OXZQcW9lSnBvUjZDTGZtaDNTbi9Na1g0NVZp?=
 =?utf-8?B?cG1POFpSNTVWVTVkL2VCMGF5aEFUL1RmL0htRk9wUTgvekFNRTZpMWNtVkN2?=
 =?utf-8?B?RmdUK0pkUkxyMW5yckllZHQzaDA0dWNqd1ZsTC9RVG5xd0FudE1GWXlGQlo0?=
 =?utf-8?B?T2FBOWw5eVNkYjh3b25PMzVEVklBckNlbjE4K3BWREZ4a3lJaUpIazZEWUxr?=
 =?utf-8?B?bmIvL1Y0MGxKd0t5eWN2UHpRc015Z2VwRFNHWk1EU0ROUWpNTjRHQnNQaFMr?=
 =?utf-8?B?OTBsaXFId2VkWWROSVlLZ2NnNVBYQWdYK2Y2c2pYWUpmMThJWGZhamJub1Ru?=
 =?utf-8?Q?mNrDMrVNSNgKlFoVEdDqRZWFA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGRYMlUzUmMvWERScThnSGxkMVk3ajlyeG1hMGtaZFRNSGZidmtoYmZhSW9s?=
 =?utf-8?B?TS8vNk5waVBheWgxa1JKUU9rVXBDdWxTZVdDNUlhNHhOYkRpY01FZWJZTDZh?=
 =?utf-8?B?aXFCVnpzd09CNnNRc0dVMnJVNXJ4VkZlZExLa01rZlVVcnY5aDVabW5FSk9u?=
 =?utf-8?B?THVnMm14M0d4V0UvKzZidHJ2clNobzJEQ1RadGF2eGdyN1EyYWtQdGY4U040?=
 =?utf-8?B?MUNuek9IOVZ3azRrSHhFLzJEUDdycWx5YXlhVmRWSmNrYWg5eUVuQXBWZ1lI?=
 =?utf-8?B?N0xzMWRmTVlPMnEwU3Y3azZRdkpQZjZVZnM2elZPYjlOU1VvQ2dtaTNOVFlS?=
 =?utf-8?B?MllVbWFxWERJNWtDMU5FdHQ4ZDVUcWtQSnVMdGYxN1pLdkdLZ05oTWc3VHdX?=
 =?utf-8?B?a2xONEVXejNzWFlnYktodHdCMzR6S1RKcm9BMXZ4dGVhQS9ONDI5amhTc2F4?=
 =?utf-8?B?bVIycmpKVStWeHhwUlExT2hvNm9udEZpOXI3cjdNajN6UXo5TjYvZllhTytw?=
 =?utf-8?B?dzV0Sk1KMDFILzJ6eUxvU1ZmM3hyaytzQTJlREQyYVVJMDFoN0dKZnJWU1Q3?=
 =?utf-8?B?VVpKR3pxbVlKZGNyUlhlR2tYS3Y4cHBrWVZiOFZ1VlhJL3ptRlRkS0UvTk0y?=
 =?utf-8?B?RjR5U29zeUc5UG05QkNoNHNUckRBd0dZUHlQMjJYbU9CSEMzWU1BMW5meUg2?=
 =?utf-8?B?aDNlRmZ5bSswWVRhYzQvN0ZBKzRVb0JSN3lVWFkwUzF0TDJEbU1mYWNGSlVj?=
 =?utf-8?B?VUxUUnVrTE4vNkxTVzRjeTRDaVNWWkxZcEtLOHI0am5FOXlvc2xxZTVtZlk4?=
 =?utf-8?B?R2VDTWFHelYrdHl1SDZIeGg4Y0lybFI3em96MVdqZ3I0RTYyOE9lSWNJMWFi?=
 =?utf-8?B?akNZZE5qK0pmcU0zWndnaFc0Z0VVbG5WTG1NcjNsYm5EVHdyNWZKZ01TbGtF?=
 =?utf-8?B?MVVSS1UrZUdNWDJyYjhKb1NlbUhQTUtQbjA4NmlLWm42WENabGtyeWR4a2Fy?=
 =?utf-8?B?S3JMQ2xLclBkZHRoQjBKT1oxb0FoanNsUDROUWpzRWIyUmFlWjZJUW5sVnh1?=
 =?utf-8?B?WjRIUE9tUWFxenVmMTNXMVhzd21WQkZ2Y2tDVFJMakNjNWxQTmZJaElvQmxL?=
 =?utf-8?B?UXY5NC9DaGQ0NTIyQkdFcTlzZ2x3eXJTWDFnV3VvSG9GYnNOblpBTm1tV0tN?=
 =?utf-8?B?bk9DSWk0UlZBd0V6Q0dMckZPalVIZDVlYkUrSmxlR0c2RndLb2RpMmZ4Slk4?=
 =?utf-8?B?RVVwMjl6bFV2Q1d4WHFtS1A0c1dZY1JRSXNhQ1cyL0c1SEN3WXZnSmh0V2Er?=
 =?utf-8?B?NWxzSFFuaGZpVHVlbUg2M01kQVo2bDZqV0prMURxWE1kSU9Ld2N6SmZRMloy?=
 =?utf-8?B?eFh3SWNDMkxBOXFsVU5yaUFkTXFLUjVlUEEvQ0JNYU9EbFJidUYrVVRIZFAx?=
 =?utf-8?B?OW91TE85RnF1bXNTa3dWek42WXhjSWc1THdkS0pQVk5oVTFoK2R3VzV4TGVT?=
 =?utf-8?B?MDZpZkdOSnhBTnB3Z3pNZWM1OVN0c2Q0b1FYdjJ0NzkraTdHZ1NlZmRKTitl?=
 =?utf-8?B?NGJuYXhXd25TQUVFcHVEQm93WXphcktMMjNWU3hQb2hFT0ZQNmxTZmhhMklm?=
 =?utf-8?Q?FphgCriEMGIOSHv88Hvhte8Rj+LV5mvPAl4d5lO7Ibt0=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-e6540.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 71203875-0849-4b59-ffd9-08ddab29aa9c
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 09:56:00.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_025603_114168_7726672C 
X-CRM114-Status: UNSURE (   3.72  )
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

Thanks, I applied the patch to the latest commit in the linus tree and I 
still have the same issue.



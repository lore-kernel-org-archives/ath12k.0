Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A3AC43219
	for <ath12k@archiver.kernel.org>; Thu, 24 Nov 2022 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAZZoPsTfbFQ2ZCFQ5oBqmfIHbgWh9sp1Ezs52cE174=; b=f9TWq6pjFsKael
	QXnoJIs37WZGvPQ4w8NY5nH9N+vfYqbDL3XUCjDn86omb6bmfG/Q7FqXzOazpA9KHCJpYrP0wFflY
	6T5Huc/ONt4nXvuUY7IQel/vBX6BY2VjG1C3j4QsJgAi6SjrjV1ilpimWgxSQm/m188eiWYe8v3jA
	clL9OkWUI4xG3gMJiZxSot8UJjrPet8xPDwPpQA39Dyvg+UjzrXDPmbN2Iw0FAr3ALFos8NgupAIp
	vBfD+c3zuFkRIbSExjoUYzm57Dp1B47RMNpqEoDPqXnEkpnUXCfzoplKuZIauTGjos/7ijCzcbQ7i
	Hyzgy4GcDNMiDukvfOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy995-007TrV-2W
	for ath12k@archiver.kernel.org; Thu, 24 Nov 2022 10:07:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy991-007TgQ-Eu
	for ath12k@lists.infradead.org; Thu, 24 Nov 2022 10:07:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOA5lxA011281;
	Thu, 24 Nov 2022 10:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=ywCZgD+TXatRaHz1F6+1i2X/D7N55UGlc3VUPwQoUFQ=;
 b=hcN1CgiKUchsoCjVmkT2LbIK1QDT3IoCpRrsqNK9NWQ1pvRGhLF5y5MDFsndMmQwE0Gu
 P6fuBkTGtNStAshSt3ndytd01DbHEiwzBAtMGoskBialCJ9ZF4LFZR8Ennk3jeYQtXA7
 dOWPNIqw9pIe8scM6yRlmdjveYK8xzZ56wu6aMUPI3RfRKTuV0yDdGJLYv+Y1KFOgrHC
 +Rj3HVgslsZDbBUwavBf9sjDdw9NbWA/FyJLjFi0BB60FJIQeOAn/V+fUv7jeHjay7/f
 4c7HCjzOzQUSFuAkO9agWTsKM2Uf6IrNKPxowPrhEQ+/uD/iZ2WxuS0tQ4rmtttXUX2f WA== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m21r90msd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 10:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0iUMRMxlDGab+qioCwH4NZzpnStofpqugxMc71lmq6pXmdnLlGQ/5M2AoqziB8ueWMfIfAxsv37ZhMiXa3fvRF/GBdhsgkOOzvM+TEQ6B+JrZw8LtW55AVVYBSAKG0uDMkrDa9siiVC0E+Hedc4huAgdVzckVhKX3vzjbO1hapZEcXf/07tgm814UenZlKAxE7SNmn9dx14x6JkOdVJgPvPqL+uqrnqE2tUyMuy8kGiss1EJ2wNS1WGbV8oj7R5k9k5Lrx6rda0wPUyQw41zhgXmKR58CmLNPGSy+24mWUTsyIJqwWvixmvRtDC0q+gNbPzxIZIQgdC2fftOf4oXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywCZgD+TXatRaHz1F6+1i2X/D7N55UGlc3VUPwQoUFQ=;
 b=Pa6Vc1SeusTMGaH6CRSGDgv+d1TsWhoNwhh8VQsB1Rrmgt1tsjrFD2yqIB9T57cA/fVwBYLjckFAgsI3hXEbto5v2Y5aLILpT39pcouEiKeF/LrrZXQFhRnLh3K/pXyjFFnko8JCUkXIWfahDUCZUR1+/2AGXTRVtOlpbCfosXToMem8QM3Su6jDGE71h4Fgndctb+/IuUX0epFT21oFvnPNUH/WPRIM8cAfQNqTfMOqNPLOlbrFcFyodeeddm8CuMV8igNsxBYfJf2hnLJbSEvzYeQi14JWVzaLUjcK2azwKgxaZRjM8fUMyXAD7bv9I0jt2KX8S97y1cRLA+n2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 by SJ0PR02MB7390.namprd02.prod.outlook.com (2603:10b6:a03:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 10:07:27 +0000
Received: from SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc]) by SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc%2]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 10:07:27 +0000
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH v2 41/50] wifi: ath12k: add reg.c
Thread-Topic: [PATCH v2 41/50] wifi: ath12k: add reg.c
Thread-Index: AQHY+drWBwfLJW5kWE2F8MI6AG+XZq5JmIQAgARK0uA=
Date: Thu, 24 Nov 2022 10:07:26 +0000
Message-ID:  <SN6PR02MB43341A84F75ED4F712B67D76F70F9@SN6PR02MB4334.namprd02.prod.outlook.com>
References: <20221116163902.24996-1-kvalo@kernel.org>
 <20221116163902.24996-42-kvalo@kernel.org>
 <daf6b5bc-fde6-d0a8-84eb-61e16a3fe69c@green-communications.fr>
In-Reply-To: <daf6b5bc-fde6-d0a8-84eb-61e16a3fe69c@green-communications.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4334:EE_|SJ0PR02MB7390:EE_
x-ms-office365-filtering-correlation-id: 78861250-6098-4d98-80b2-08dace03b0a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cYEomq/vMZ3rnD6IFOeTCYdy9uHhJ/PZ+ilcp91lZGvwKjRG2TLPGH2tMR4sUf6zo5EH0XFEQja22RhwEaWVc4Xmdo58MahFPrNpdOKCNIAi/UiDXBgA/gUPfVESmcWqlc/UkHuG6EgpkRSkvQvG+iJ2d/xMTuY2p6YVMXxD1k5Ho1GOkNST8+pHrifZQNN3r7qJryvR+tLnz8OdK+YqRoSPmrPA9fRWqE43FQSFcUaTYMALQGjb086Z8i79funLLMGwbxsl4HDOFuMZJy4VoKrygLwJEHxJQAdvB4SCuPKY0HCS+3jZXVPyUAm7GFGtnJPikj+P93x+JlGmXHBLUIsRzfOhTfv4sgfaP+uOoC2Nc011CquxdLzIzfEdTLTvtxkaY9Wx22x9jSrgl4r65oSD5cSFnmti8jI39cZs4zsyFS6DqswFyJMBNjux7VW889nXBBZrXuPXDoFU4jVr03Qa5uqodYiT8U3mKGJ1ZmWJDPPcm37KS+sJAGoUP24B0ROEFgFwzTls4Hf42EiNvYiuOAYCvuc11OlAEHQsh2ay2VesZxxUPh4WhbwBIFfDtxzBlsURJyGtck85ENzN9GbzfTtUUbNFklhxNvj9OL9U2buAHmjIT7CbR2anArdGjexmZMZCqq3AbolCq0715Tg5o76X2ikgZ8T8+opc6oh6GP5q93oFA1Tg/3jAwErJcZ6ukcL81RJxCayhrKZ2Iw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4334.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(2906002)(122000001)(83380400001)(7696005)(6506007)(4744005)(26005)(9686003)(8936002)(316002)(33656002)(110136005)(86362001)(186003)(52536014)(41300700001)(38070700005)(5660300002)(55016003)(76116006)(478600001)(38100700002)(64756008)(8676002)(66446008)(66476007)(71200400001)(66556008)(66946007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c2MrTGVSOXJsdFJUM1VRdHNsR3dLN3dNYUZjR05NN2NpT3hKaXFWRHprNmk1?=
 =?utf-8?B?aGIzR0RtU2F6YVhORllSTlk0aS95U3BCSXFkN1ZCNVhmQjYxU042QTZkTHlR?=
 =?utf-8?B?MEJmeG5FbWZWVVRJVnpLMnFOeEluZnBhWHZRdEtIbFB2WXlzanBYYlNXRzhM?=
 =?utf-8?B?K0JETHFNS2lpRnpKUy9KRGVEQkVXUExXbC9LVmdhUnlMV0tYM1NyL05BTmx3?=
 =?utf-8?B?dFZNdVhKdGVpZnhOTXM4Q0x4Yk1PdEMwUWlDZ25keEFCa2llcGlOVXQ3NXdu?=
 =?utf-8?B?a0NmZjZieTV2UXQ2NUlNQmxYOEpKS1d5SHROVGs3YkJmSnptYVJkOVlEVTNV?=
 =?utf-8?B?TG5LNGlsZ1RDZjV4WEFaNkJ0TmN2ZE1tZkd5c25oV2FISCtmcXE0TXZqMU4y?=
 =?utf-8?B?WHBaYmkwZ3M2aHNnb2FqbmJmMml2V1h3aFlNUUd5ZzQ2UURIZ0xBZ3lMWk5p?=
 =?utf-8?B?QzAwWmxORGtLRjBWemRUNFJmRys5ZGo2SC9yWVNLQW5uSm1LOUpYME1rdW1i?=
 =?utf-8?B?RHF0RmhSNnlnS0Q1Yk45TWd2V3N1dHEyZzloOGYyY01IY1F2bFJ0WWdxeW5O?=
 =?utf-8?B?eFNqVUNBSDVMSDd3NlloQWZ2NTFNQzRuYllUczRMOEhRWkxPQTEyeUhJa3I4?=
 =?utf-8?B?U2ZsQzhXcXhabWpqQ0lpRXNnaElLdWkzY2pkNnBJYWtWbC9MNDR6c3EzS0JG?=
 =?utf-8?B?c1RyOUtvWFJZSzcwcWFOOWRWSTB6NXdCU3gyMnlOSFIyd1FkblZiek5RWXBT?=
 =?utf-8?B?bFRWQXFFR3llVUI2NVNybk1DVGFvbVF5VWZOdkhmRXZpaGEwTk93alozREtU?=
 =?utf-8?B?YjlKcVpiVjl5NG40Y1VKOGN5SEVVc3NicEwwRGk3MXhqSHEzY2lHbTBDa2tN?=
 =?utf-8?B?VzdjK1FrbVRDU1VKRmkzL0ZqWEtjUDh0YndILzZKUGQvWVQwSlVXM0VyMmhP?=
 =?utf-8?B?WVF5QTZxYmRkUk9NU1c0bTc5cVdERHBWVUoxRm1xZjV4NlkxZmNydDlKRllE?=
 =?utf-8?B?c01zMkN2NThMSndsS1VKTUZiZU1aRVdoM0lja3R5ZzNuOHE4U2ZYeUhaZmk4?=
 =?utf-8?B?QTU5VHlJZFJIZUZncW8xOVpNMFVSdkp3U1hHUkxXU1JKYWZPbUxtTmxjZk5i?=
 =?utf-8?B?c0NsUGxKZUVtU1JlS3ZmVXZPSkRDdnYyR09BVnpmSGJHNjVxNkJrbEk0eWU3?=
 =?utf-8?B?SUpvQXdDdVJKVGdhYTJ6clRUbjdVa0FnU0o0bGRxUllhRllrTzFGbGxHbnZ6?=
 =?utf-8?B?UCtuZWpZZEdVeUg0c25FYXI2TUZQWWp1eHVzMzZEc3JJK0duZFI1dDgwNTRO?=
 =?utf-8?B?VTA2Yi8rWUlta05kYWgzeFVBbUNFVmJiSWRyekhzbzY1OGJjSHF4empDd05z?=
 =?utf-8?B?YjA1MjczUUs0QWVJcS9WUzUrdUg0bzIrcWRyQ1NwS1hWdFY4Vzc1NlFvcEtR?=
 =?utf-8?B?K3lQUjdZQ3hQSjVvT2NGU1dhc0QwWFBrTmVRZWVRUHBEMFZIMzVDZ2pXTVFD?=
 =?utf-8?B?WXUxQWMrMmZFVVJkdVpNRXREdGFNSnJ1b1lRSlQ2ckROYlhadUlrcW1keGpO?=
 =?utf-8?B?V3VlZTVzMjVkaHowL2VBK3dZcVpqbmJIbXRGaEMydnZ1ZHlVc3IxVHVobUQ3?=
 =?utf-8?B?bDVOWlpsenNXbnVQbmNZcGszRCtCMncwZmFtV09RY0RQMHB4c1F3T1J0RjZy?=
 =?utf-8?B?WnlabFU3V1NOdVN0N1E1c0IvbGtEK2ZoR2FZVWpDVVIyL0syT25TcVY4aGl4?=
 =?utf-8?B?bVZhZGoyc0MyZzJsdkErellQbFNpNTZ2aGtxdG00OHNQUGhOaGlZcXJCRWll?=
 =?utf-8?B?VVdWTDRHWUYzYk9MbDNNUnVMWmJmeVZUUXlPWndZV2oyM2pMemdocCtQQXIz?=
 =?utf-8?B?R3E1MW4wS1E3TWRuTkxoRmhDNTc0emFocVBUM01PYVh5cTNxWHlGRmxmUllY?=
 =?utf-8?B?cUFaajRyTjdDelFOemZHRDl0dVRKOWVzYTYxTk52czdzUWtLK1loRWtROHR1?=
 =?utf-8?B?Z0ZselJ2RWc3S3VHalJFQy93US9kTWpnY2RtTnovKzJlWDVDbmp5ZGpwaDlj?=
 =?utf-8?B?dVlqM2dlNTgzVnFTMTU1VE5idzBldURGeS9Xazd4WnZrMkFnUjlPV3NoUzR2?=
 =?utf-8?Q?a3dWsDqX9J4MEVro0+bs7UYSF?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?M3ZlZXNMU0pjTDBEcFdiQnhhN0J6cXA4Y0xHN2lUSDJFWWpFN1NiQ2Evb1B4?=
 =?utf-8?B?ZVRqaWdYSXNlZktMbUl5bTZ4WWhZYmQ5cUZKYWFuR1ZUT09oMEFabFpOSXFm?=
 =?utf-8?B?cVRUKzJsOWF3U1dOeHpxcE40OVM0U2VuVW54cWw3Zlk5L21GNU5obUVoUGxp?=
 =?utf-8?B?VXRQOGtxaWJNSldVQ1VhMldYUUR1SFlSQ1hWUWYxSm5MYXQ3TzliWnp3cUQw?=
 =?utf-8?B?VjEyMW5oOVZUczdlVEF5ZDZRalFxenFyaHU1WmM4YkxvWjlwRDFnWmdQSWMr?=
 =?utf-8?B?dEpWQlBqZGVuNVRCWUsvNGRUOFNwVlBxWGYxWmgycTlnd0VzWlVCZlRjeWVi?=
 =?utf-8?B?bHpuMlNHWktBeTV0MEt2UnVVanJkaHAwWXFEY01DQkhRTTAxY0dNblpqeXly?=
 =?utf-8?B?T1pxNDBmNjhyOUcrR0VTV295T0ptZFJkN0FPa2ZGU3dNUVFaOWZtWHFrQm9E?=
 =?utf-8?B?d2VZMEc3a3d5TnBhK05UeWdzNWNsOTZXeStLemRTZUxRRnFBSFQwYVNpS3Y4?=
 =?utf-8?B?TkZGY3k3bGVlY2lyeU1WeC9vOUxBMXlmenNYR1RsMXF3NnZ5NjFFNVFDUkVl?=
 =?utf-8?B?N1MrN01UblBTOXpPeUFUclg3M2FEbmd0bHdkTzVhaysxM0ZaSDg1cWRjcVg1?=
 =?utf-8?B?R1NzSmRRUGI4YjZWNG83RWZoSHc0eHJCZzlRQTR1K1RKTzBwUFhYOFVTZ0tO?=
 =?utf-8?B?M0ROUWkxZFVwdkVsUVI5Ky9zSWhrRU13QnhYamVIanlLY3d0WFM2QVBwa1JY?=
 =?utf-8?B?NmxSQVlYK0wzU255T1hiM2RKM2p0YkVGSDhkOUZDNkpVb0tHOWoxSGNxd3hq?=
 =?utf-8?B?OUxieGtrVVhjWDkwcEVaWVZWaFh1cG81OFV1LzVmVGdsYkEyc2xSWEIxd01E?=
 =?utf-8?B?NTQ3Sm5rNWJtWFgxMFNaSEhXSmxTckFSNm9ESGVZWG1Odytsa0ZaNFFUNmtM?=
 =?utf-8?B?MHkxY25EZy9JNVlnNUlMdWFXcjFGNHduMUZjK0ppeU1BVStiS0o4bWxERjFR?=
 =?utf-8?B?Y1BQaUtEakd2RmkzcHJNQUN3bzM5TlZ0UFhCQ0FrNElFOGpXVHNEdFVidFZC?=
 =?utf-8?B?T1gxTVNrSnhMN25qM01wenE0ckFEaWF1aUFPd2tINi9tNm5iQVZPcjlVR1BG?=
 =?utf-8?B?TCtYaVplQ0JpdmFlcWdnM0gyLzVVTjR5blVwendnUEN2Q3Z3S09MdEI1TFF5?=
 =?utf-8?B?eloxVVpuUXBGaWFIY054Nkgrb3MvRWpiQktPQTZCWkFZVzNXYXFCWDZ3R3Jk?=
 =?utf-8?Q?0GRIkBsdbGuetua?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4334.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78861250-6098-4d98-80b2-08dace03b0a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 10:07:26.9581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSNfrf1NFIxEo86DplzCcm59MEWvdy0mueZEQMklYtFAJT+jyufAxrfHDqi6h7mvM2uhzoTqQtPP+EH32weV6M03VCYwg0HBj+uUkGJrCag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7390
X-Proofpoint-ORIG-GUID: aEc3HAMoxF4OZHYQMn97dBMeSQfBOmvQ
X-Proofpoint-GUID: aEc3HAMoxF4OZHYQMn97dBMeSQfBOmvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_07,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=940
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_020747_669065_8E8D40DF 
X-CRM114-Status: GOOD (  12.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

>On 16/11/2022 17:38, Kalle Valo wrote:
>> +#define ETSI_WEATHER_RADAR_BAND_LOW          5590
>> +#define ETSI_WEATHER_RADAR_BAND_HIGH         5650
>> +#define ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT  600000
>
>OT, but maybe cfg80211 should be taught these rules ? it is apparently
>unaware of the harsh ETSI rules in 5600-5650 MHz and this affects all drivers.
ATH12K is a Self Managed Regulatory driver. It relies on the info provided by
the firmware to build the reg rules and pass to cfg80211. Hence it needs
to populate appropriate reg rules corresponding weather radar band where these
macros are made us of.

Thanks,
Sriram.R
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

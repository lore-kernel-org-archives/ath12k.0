Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56085C433FE
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QP/+RofxdHg+IUBw9abKzfxZr5hTCAG5qt1K7j/WVNI=; b=Eerrcr6w25UqbJ
	Da+6wOKmy34o/xyAVlVaf5I6an0LNmnYcvECGboteVXGoPPkdc6lS1D5wCGPsw6lbS0DrJK+SrHnk
	RcaZGzxeHmOptwu9UC37b6U3dQT94DgScsynWVsCNNJp4r+t0w7tFB5VyR6haBmUG0JQk3VtBt/Iq
	8gPgyNKWTef64NP2TKnJNWaQEwYlvePpcLY+9FgBc1eOnL9GbcTYV/YkFu9tIsgIfe/y8rRpcR7/e
	zpTNT1tLVh/9fu7YjrnTaszUV9qnxcbqZNOeXKRBD5KtO8b7e74FRhJBhz85N/xqCAK9qf45aofqT
	fb6syy2UVjGIAOxMPE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offrT-009Tor-PM
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:13:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offrP-009Tn4-P4
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:13:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294AfYRX008892;
	Tue, 4 Oct 2022 11:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=H+Is11EgGsGq89YC+WwB/xVxSTBL+s8GuLb3oCgg0iA=;
 b=OSkJrTzM47DxfrzaIeVG2BojBhUvu1KU6MZYi+Qnx+b0Blv4UKTd3ySH6DkUaMHoCmG5
 IjltaCMAkjoBhCsSYZut280JwEvOn7SGcgC4sNnmELkSKW9eqsuu44HPP56o2ZDHLkQc
 vALetnCl/yuT9FeiKs35lQ25h3cJ+rBOlqL9HVQdsfAUFxVONPo5kv/Nj3ULpJ9/16n2
 TCEOdh+lDeuKKJ0vJcI5ED34nwoy+UfBlmK06Z/JFHqJyqLreRmuVb5c1XVs8F/oEHGW
 3Ojp3XV0QKhTm5O7WJHqgDQWpiqG2ofQieNZ8GpGccPDZJ182AFaZyZNQpcAd32T7ezs sA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jxawu60bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lo2xEpnCQIVeDNx2x/XtOQvUc/Ti1SCkvhZWNxjyeGaRAEORtUN85nOGECA38PQHlOIitXFAp9EGJ22xZHz9LdkrOfVxcAO3yVuCxx6aWNqteaNQ8PraWB0xVVIozZKRKMxR8yuWlCd7W9O1/pdIiENUshaZ0iY/Yi3ZqOxukToJcVmiION0TFqcZMOnl5Sit8VL4xcTytZLnQuPHkJgvUqKJ2+Y/hA8ITASoPu50TdGN2jOcCBbragpFXRE6UfyM4zfplhtNswh2zDH+yq5ODSt5rCcFbU4Kgq35Kq2bIfZWgc3Cwm6SxiilsHCzgRgXf6R7OOLPwiIWWrxyeFFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+Is11EgGsGq89YC+WwB/xVxSTBL+s8GuLb3oCgg0iA=;
 b=mXxzPvcYAhwLhNykvBpxn+ESyWd7QQeDrbYCyltCzKJmcoSbpbV4Evzn3VfrW/qpHyWvSpvmTAYSbm1U7wfCQVR1mp2D1U2EVSnyvSvg3gjPchqjjC3/Zmtj5LB2X7708VBE7pNtiPS2CmVu/KmqYeYVlweodLp4HYhtiA49UtTtnpl+Vd6r2vuYwsqeGWg7SGli4ApTv4nDzhaArWlPdFLgLb95f4r/eYFJHarGCMGCmxksNaZ7jN0mcgLpcDcgFFlJdzMgZCAXIsKfffsDrtwmzgYXu1ue6Ta7DgeKEJFpRZz026SBrBU9D9H7PcOgJzk8/rN8Og25S/BB30v0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by BL3PR02MB8020.namprd02.prod.outlook.com (2603:10b6:208:35b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 11:13:08 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:13:08 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 19/50] wifi: ath12k: add hal.c
Thread-Topic: [PATCH 19/50] wifi: ath12k: add hal.c
Thread-Index: AQHYrmYZrMKmFPgItUKzKOf2tYBJA62zzBQAgEqbDsA=
Date: Tue, 4 Oct 2022 11:13:07 +0000
Message-ID:  <CH0PR02MB82125427A93812F0BED68485F65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-20-kvalo@kernel.org>
 <681e43b3-51c0-ed6c-4607-d60127650283@quicinc.com>
In-Reply-To: <681e43b3-51c0-ed6c-4607-d60127650283@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|BL3PR02MB8020:EE_
x-ms-office365-filtering-correlation-id: f86ea208-cc50-4745-0811-08daa5f96a9c
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mMZRLW9RuwZMb5cBrLt3z82iIZbHuosOxYqBKhv2JJTwcQ9cO2b6ojIKPvMwuSRFAkXUQ5NSuhu1IXk8SfTd+YPtth0cRsK1kYxiOgzvCjHh7X7bHURAOEXu+o+Zxkf0MrFbzQFFzYCPO0KG/vH3UzQaeCJF4nw3MZMXfWCn5HtQr0xfp/RUrI9HX2xgLZaVBhDGVv7fw/G7LHim3LI++57vHEO8bv1jbiN/+wZU2HNQ1D3dljQfGf9zxNmkws5HY/Orji/hZxgDhcdr2VX94a18gUFTVHioTtZtyDt3UN9koCjz3DnV3H1/jSwUiIUQKisVkAtw1Ls5SQc/nehGH3iGJEDwSKI4EahUIYor3lDON1BQmjcOvyNP9/p1GI3SSEjW5AlHx8N90ac1BcbWTg4CI5DNULUXcpX8gifWbfUHXH1TFaA42kHd4Ohjit89gAZOwbyCUKeSncBGqCRvVFMDAzh0fQZjz1T0BDtxDcryLxRu0bX9qTnLgbpU1IWFI+2YJUWN1I/u72mrnn0ztx0z2tzBZtdlbGsrUuNF6ewcxy0E4PGHZ8WOIjF4ewnzzSzHvmqm6r+392dHf57BcLVJlB/58+P5dNOEbymMmwVsqvfHDtJ9aHx7M4eyEOT6WH6+VI4oerD+K73fhBs0zETvJWROabj7qgQLZOUGlrPKhOtV0BZQLdq/TT5isusKKnWkrvi2ud/dHKqI3UkhO3EBeA5ky2w6FmKvW53Oj3rtS4g2qt+w0EOMfOUyS4W18mqzCjp7Dujlwchx4M6C+g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(186003)(66946007)(66556008)(66476007)(66446008)(478600001)(8676002)(86362001)(76116006)(4326008)(2906002)(5660300002)(71200400001)(53546011)(64756008)(26005)(6506007)(7696005)(38100700002)(122000001)(8936002)(55016003)(41300700001)(83380400001)(33656002)(9686003)(38070700005)(66574015)(52536014)(316002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S3BSdlVKS3d4cjQrcFRTZWlrUldSaXluNFBjTW1udENlVkx4WnpJdi9FdjMv?=
 =?utf-8?B?VEMveXp5QjlpdkpYalQ0Q08xYzRDTXJsWmZYNWx0VEpMTHB3eG4xQno4czlS?=
 =?utf-8?B?YzU2N3VSMkVMc1pBSWNaN0k2TTUvazJjY0dTNHhhNHJodUtFTFdDVTB2dTdp?=
 =?utf-8?B?TWJ1OHdqMmcyUHN5Ym4wQ240akdVYkFHV0gwZ3EvUlAyd29HM1VVVlFZSnVC?=
 =?utf-8?B?dGRnNmZ6N3lhTWZJc2dtSWFVZEtuTUd3cElhR3AwY1hOUGlOVmtaYVowUkZS?=
 =?utf-8?B?K1IvUnM2YjdIbHhVZHNORmhwaFlkSm8vS1c5bmZ0TmJqWVlmU2twd3l4QmFS?=
 =?utf-8?B?aURZWTNpbzlaY3pJYnV3ZDAzRFFGVjJVNUQzZE5aeVBDajhZdlVXRExCVnp3?=
 =?utf-8?B?Q1NrbGp0M1MrNWVLSitnTkx3R3hTRTRpajQyWmpucFR4ZGNCS3hGNGRvMmV4?=
 =?utf-8?B?WWZlRStiTHo0NEp0WGs3MkZuNk1USzM2WG9saTFzbFFnelpkTFdUQlJOM1pT?=
 =?utf-8?B?Tk9UZ21IdHlYdDU3ZTNBNk15UlVvTFJLKzc1dU40Mkg0dnIycENOK1dPSWY4?=
 =?utf-8?B?OHVCRFhSbDRoNkhMcjFkbXBWZG55WlFOY1MvdFE5TWF5K1ZwL1UwNUlpNnFY?=
 =?utf-8?B?dmFJU3ZqdjFJdlNwNEp0U1ROWHZob0tsT21zRjJXNzF0YnJzbFRWMkZ2enJr?=
 =?utf-8?B?cU50clpmYzBhbWxETk5Wd0l3cTZLWHBxdUcxTFhxaEIyU0JhWkwyODFUUGVJ?=
 =?utf-8?B?eWdYQk5oREdQL251VU1neGU0SGYyWWNNRmtnQ0RxVytEM29nV2FIRGVlLzYz?=
 =?utf-8?B?cUtvY1NsVHhqYWZJdG5EZ3BjUnJyNHRrN2RzS0pYcGhoTGJPdW1MOWsxTm1M?=
 =?utf-8?B?TjA1R2pic2Q1TjczNC9PY1JpSXFvMWZsR04vU0MvVGtjc0tzZWRDYkIyQVRI?=
 =?utf-8?B?WCtTZW50WjdURkdNMXVVUzNYa1ZzaWh6UTB2RmxXUUZiM01wWUtDRThBamFx?=
 =?utf-8?B?QjAyWEpQSFhsMlkrL05zRmhBRmhMaDNvbU9IZHlFZUE4bFlwaXBYazZBejJC?=
 =?utf-8?B?TEFtNjdMVDExR1RkZ011TXBlcVdQV3lvTm90UnR0enprNUpIb0lqdFRmTis4?=
 =?utf-8?B?QSs3eEVNVDltRSsrbW9UMG8rT21vdXN6UFpRbDl5UVhKT09BU043Qm1HbitG?=
 =?utf-8?B?Zjl1b0h2YUlScUdWOUFmaUtZL1ZwQkRRdE81cjFpdE9QTXZNN2lXdnpSeTVk?=
 =?utf-8?B?MmNOTnorVy9namkycDdDOW94MTRMQnhGMitNN2NDajNUSmRoVXFTMFdRanJx?=
 =?utf-8?B?TmdiMjNwT2NvWkR0c2pEQWpiZG9ud1V1ZCsxb0hrUFlTNUNjNllDZDF0TFFh?=
 =?utf-8?B?bDh0UUdlc0ZZUzZKbWJ5V3pxc291bG9vZVIrY0Q3bVVxRnZHbzdsT05VQm84?=
 =?utf-8?B?UHVWaDh5Y1VaSXhwd2FPN0ZzZDhiaDdMWWYrZ1A3VzlVRGhZSzg3N1RWY2g3?=
 =?utf-8?B?OVRVNFF0RUlXdE1nUnBNWU5JVGlFS29kU0lGQWthSWgrUXJhdGxRdnRUOWpL?=
 =?utf-8?B?ZkVwUHpxelhtcFB5NUhCWG9VY0dYaTJ0TjlwbGdlZkdEYzJJUGRJT2t2b0k1?=
 =?utf-8?B?MHRXakQwOVlKM1Z6SkdoYzY1RDM3cXNWZzcrc2ZrUy84WVVTU2s4dmw2azAv?=
 =?utf-8?B?ZFR3L2VReG83Z2g2NDgrdHBYMWx1TlpUZTlwN3orOCtVL1lnWXMyK0gweElY?=
 =?utf-8?B?dkhWNjhVUUh4SytpVk11K3BMQkhZc3RsOU14akRQUlZxeUYyZm5kbmtUTXNr?=
 =?utf-8?B?d1BlTG10U0x6UWlsM2F6cWtKV2QyV0N1ZU1Va24xaUpCQUR5ZDJwbVdMMHBW?=
 =?utf-8?B?QUtWZFZIdjdSU3NoM2RQWTZKS2NwS1VPbkRKT3ZHM0FtaWZRUWlJODVEWVpQ?=
 =?utf-8?B?dUk5dGFNeUxlQkpRTnpmQmJRQnBGeXZabUxIRTFYMnhBNXRVTG1BNUFOU2px?=
 =?utf-8?B?dTJ1UEg1MHFOQS9zcGJNVklmZU83YWRvaXQzMzhHUk1CQmxEOC9mdHllOUw5?=
 =?utf-8?B?azVGbGx2MUE5YjB5RWNjZFFVZFhyUWtHM1lEL0d4bDdkSE5OUEJSN1JQaEhz?=
 =?utf-8?Q?DJpZkf+ikH6omd4leNT1UKTWq?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86ea208-cc50-4745-0811-08daa5f96a9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:13:07.9927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfDqpjGbyS/czLYB1tcQc1U3fUPVM8OiSCy4gPp4apAwoU2snM5TBLSq6EwbeElWvvBovG9eiAXtrhs47qH0sk/M6ecDTBJP/sf4xObzU4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8020
X-Proofpoint-GUID: 35mx3kSqMW0ojcdAa7gKs-tRnXI6rrf6
X-Proofpoint-ORIG-GUID: 35mx3kSqMW0ojcdAa7gKs-tRnXI6rrf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=844 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_041315_951905_E263A700 
X-CRM114-Status: GOOD (  30.80  )
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


> -----Original Message-----
> From: Jeff Johnson <quic_jjohnson@quicinc.com>
> Sent: Thursday, August 18, 2022 5:23 AM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 19/50] wifi: ath12k: add hal.c
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
> 
> On 8/12/2022 9:09 AM, Kalle Valo wrote:
> > From: Kalle Valo <quic_kvalo@quicinc.com>
> >
> > (Patches split into one patch per file for easier review, but the
> > final commit will be one big patch. See the cover letter for more
> > info.)
> >
> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> > ---
> >   drivers/net/wireless/ath/ath12k/hal.c | 2179
> +++++++++++++++++++++++++++++++++
> >   1 file changed, 2179 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/hal.c
> > b/drivers/net/wireless/ath/ath12k/hal.c
> 
> snip
> 
> > +static void ath12k_hal_srng_src_hw_init(struct ath12k_base *ab,
> > +                                     struct hal_srng *srng) {
> 
> snip
> 
> > +     /* interrupt setup */
> > +     /* NOTE: IPQ8074 v2 requires the interrupt timer threshold in the
> > +      * unit of 8 usecs instead of 1 usec (as required by v1).
> 
> why do we care about IPQ8074 when it isn't supported by this driver?
> and where is the 8 us vs 1 us logic anyway?
>

Sure will address in the next version of the patch

> > +      */
> > +     val = u32_encode_bits(srng->intr_timer_thres_us,
> > +
> > + HAL_TCL1_RING_CONSR_INT_SETUP_IX0_INTR_TMR_THOLD);
> 
> snip
> 
> > +static void ath12k_hal_srng_update_hp_tp_addr(struct ath12k_base *ab,
> > +                                           int shadow_cfg_idx,
> > +                                       enum hal_ring_type ring_type,
> > +                                       int ring_num)
> 
> inconsistent indentation?
> snip
> 

Sure will address in the next version of the patch

> > +void ath12k_hal_srng_shadow_update_hp_tp(struct ath12k_base *ab,
> > +                                      struct hal_srng *srng) {
> > +     lockdep_assert_held(&srng->lock);
> > +
> > +     /* check whether the ring is emptry. Update the shadow
> 
> s/emptry/empty/

Sure will address in the next version of the patch

> 
> > +      * HP only when then ring isn't' empty.
> > +      */
> > +     if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
> > +         *srng->u.src_ring.tp_addr != srng->u.src_ring.hp)
> > +             ath12k_hal_srng_access_end(ab, srng); }
> > +
> 
> snip
> 
> > +void ath12k_hal_srng_deinit(struct ath12k_base *ab) {
> > +     struct ath12k_hal *hal = &ab->hal;
> > +
> > +     ath12k_hal_unregister_srng_lock_keys(ab);
> > +     ath12k_hal_free_cont_rdp(ab);
> > +     ath12k_hal_free_cont_wrp(ab);
> > +     kfree(hal->srng_config);
> 
> perhaps set hal->srng_config = NULL so that there isn't a dangling pointer?

Sure will address in the next version of the patch

> 
> snip

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

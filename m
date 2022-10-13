Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D89C43219
	for <ath12k@archiver.kernel.org>; Thu, 13 Oct 2022 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Np4LGIY5ADDNgFA2dciIgEJQbi+PAUeOyu9kcx6IvrY=; b=bgsguZdvP6BI7t
	DXQwvZbBLhdlyg17UHUg+ekuwVa5Cd+8AglGXvdNDSCJjPDc67KMY20FCcyD/AXIERdY/18Q6kC1g
	qhJ/2DEuASj+u7GVQZas4/QfLGLRxpkRpLeLESxwgyTBz7pCPp4ICXbx0slojQ+zM57m/3//pPovg
	yBO9VvUgYRQqrRyc1byzqHDKlJOj4fQlryiigvb/uPn7s7Xce8CwlnSlWRbLAfxBHF5Ohj5cHHmWb
	yvVgSzn8LxUstSt+dPdtE6SpgOtX36b5kAVvdJHqy8yk2hW5neCltwbEl1nB+QmONg9BvPPpqNaxk
	9YlXpWGlZsIRqVuK3S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oirBR-00AlGC-Pv
	for ath12k@archiver.kernel.org; Thu, 13 Oct 2022 05:55:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oirBO-00AlEw-0d
	for ath12k@lists.infradead.org; Thu, 13 Oct 2022 05:55:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29D5fEUk012866;
	Thu, 13 Oct 2022 05:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=b3YRSYJWbpBoe5ZatNdK25TjQXx0X75Y6KT+y1Tw/aA=;
 b=a0pvM3K8wYzS4UyRcVAytBh5qZ1L8xHcBs+y8yp9M1sNcaOu1SGMGYlnsC1XqCYQ8a06
 cIiTPfE5y7jUesaTkI5A9FG/BQ8ulAtUl/F4nP2JMabXl1399hvwQ3dEIrRHFpIV9tId
 ivo5kwy+hP/L0rF1oZHC+MSwIMGjIBRtGdTUyY6v4a2xz1dYWNkaDMOoSCzc+MLomHpC
 b2871YRfH0CtLm514jBLVo6N9Ju8cQ2IMSmzL/eBS7+G/4tEG4Z+655uuC3K1E8BBmLg
 Uv2YUrQO+eEcdzxpnu4K37/LOQDMwTDn5CazOwpEPXpcAcjY/wHP7YaPemLWDDxMbtJJ cQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k66xjrwfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 05:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnwqQcnLOKuUjpCfg6yM3PKCmVmm78hPfTyhkkYwV53LrmWh2muw9aqeEFnWQRtKR28KcQHy+yXvpqKE73kaw6j64vnKDlKDJqF9o5X/Fgf6RIEZ1Kxc4drA9uct7d4XJtzo0PsmVgI5i5F0ie4uRqXwy94e9QwLsrFmL7n9hCT8sKxEGj30Hf+k0VXvAj8b+GS4B0C6UnTkOtya5J5OCPSav1bhapJG9D5PZsFbb4vPxjgsffH13OylANy4UkHJkqR7JwVKRdxkpynAkUvK9pMx/DIQ2qJVUA3GkEvMnSvEulYyaELR6klTG2r/Bc32kK9cJvScpeK1EO2Qhr6x5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3YRSYJWbpBoe5ZatNdK25TjQXx0X75Y6KT+y1Tw/aA=;
 b=bU+I+dWYPU8UVAd7Dta+rlxas8q1VWlXPcDCtCit1yHdd5kMnz8umgp2rWMm8QF9a2eMGchlj49HWXadpFHG6dUTu658ZbaK5DsMm9WIrl835RGu5VvAc+4CY8teIcC+BvpUsd+cZjm9Yj3HLD4SsBLH5soWZixkZ2Y7jysnZVDsc/QbjemfQh2fh2fxKw9jvUQacJuKwOrTHLu6CuZYAU8C3G055VKuPOodrS+GN22iN8s8rmooXkV+mhCAk7W0TVQj5kEP3ZrNa4gWIUsgQX9D4BKzru01j9nmRWMDKaSGGi68mM1atPka3dwpNmi3SLpy/KhgtJbe07hWlhC/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 by DM6PR02MB6541.namprd02.prod.outlook.com (2603:10b6:5:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Thu, 13 Oct
 2022 05:54:55 +0000
Received: from SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc]) by SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc%2]) with mapi id 15.20.5709.021; Thu, 13 Oct 2022
 05:54:55 +0000
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Thread-Topic: [PATCH 15/50] wifi: ath12k: add dp_rx.c
Thread-Index: AQHYrmYbHK9N0DA8vkGURLObKZSNEa2zws4AgFhwA1A=
Date: Thu, 13 Oct 2022 05:54:54 +0000
Message-ID:  <SN6PR02MB4334C052EA71CD13F0506E55F7259@SN6PR02MB4334.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-16-kvalo@kernel.org>
 <b2cd5b02-60ca-c788-af71-9f36f6a8ede3@quicinc.com>
In-Reply-To: <b2cd5b02-60ca-c788-af71-9f36f6a8ede3@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4334:EE_|DM6PR02MB6541:EE_
x-ms-office365-filtering-correlation-id: 7b71a00a-aaa6-4935-5dc5-08daacdf73fc
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XZbYFUjSRFVl4XayasaOjCOFhoD1FPLTlqrR3mP5UNk0IDnEJfwuvQOOT+6yPJI12L4HMEPbTmdgAXNMYjJfOJwkqWOpzhOh6adk5MuU2H1X6WQfAtAF4IqEujNGZVPmOcixBA7rRfih1KZ3qs3q0QO8vzH28sQZZiOFJXGmtbMVbx06iElnMdlOy23T9Oa3FNbKQjBR3GeYzn44laV7k9JwtWVekjc9xZ1DzAbXoCeiqNYVRjCBZsZRwB27Hyg+xO4wAQVNWNYV4Pn8EEZ5qOTBwTrfArst/YmuzrsPm43P6MmCp1c2gKJxey7HWikEUu1lO33xqTqKFifv+VTZ6xP1eWXLW61CUZyrsfP3bvtY7+/T8ykD0BPKuTsLrFzSU/MRsbMAgGGcI8op4ceGJIZFi4Le8O51lUSOfhGBmMsAD2ZgJHqINzMjoQbrRh2NKjassGm0Iqa6TF702RY9MjfThspuinmmcJ88IA6WbuPNNEcGaInsmN47tcTaPiOcSLHDtEOfCNKktcGp0kX457wm2aAQyekRbs9EdApso2F02CBSlPoTdKhfFXYyP654Vho0KtncIfNHP471sx2R4hvVSBT6tcYIeFitRn4K5p2Q/kCXcTMt2wNdXaaVG+PfrIU1o//lziUIw4bGwKb9XvahDl5/BkGbhK1zW6uF3kE1x51dUiEF72FBB9BVXoKQfLTo6N6GV50cwKxtRbQX1l3VlkF2p/dYJ1tQrU+FMaZipGUSXW/qgXO2eePYIGU5Clx3iB+RkDUawewzQKK+AA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4334.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(316002)(5660300002)(7696005)(6506007)(4326008)(8676002)(66556008)(66946007)(76116006)(64756008)(41300700001)(66476007)(8936002)(9686003)(52536014)(26005)(38100700002)(122000001)(38070700005)(55016003)(2906002)(33656002)(186003)(86362001)(83380400001)(66446008)(478600001)(71200400001)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cFlXam93TlUvbnpkTVJhUHdUdnorTkIvQmtJOUlSZ1JEeFlQWE5FSE9MVXV0?=
 =?utf-8?B?ME13bkYvYzN5aVdtYUxiNG83WXpLY0NqRWFnNkkxOE1SN0hYSjhIalB0ZkpM?=
 =?utf-8?B?WkhHT2dLTjhIY2N5U0Z3VklWRm1ESkZiZ0JhYW1Gd1hJVXpUOXZJZ3BxMnYy?=
 =?utf-8?B?ZXN3SUJ2SnNLd2IwSzVkNExkalRWVlBYYlFpRi9Ub3JuRVZVK2E5dzhQS0hK?=
 =?utf-8?B?eWhHOUdLOUY3RjZPa1BaWjhNWjcrbUhPU3ZWcm1vY21JV0JObU9hejJRaFc2?=
 =?utf-8?B?QytPb0VNSDFkWkdsRnZmN05MOXNhbmpLeXJtTW94ZnI1L1Rwc0c1QVhDY0hD?=
 =?utf-8?B?SUIzVkR0QU92a0VCYXgzckhVcSttSm0xNnpqbklCTnB2eVNsZWJ0NVVSeDR2?=
 =?utf-8?B?ejRLWHltV1JtOGFoZjRhV1U1L0pBZSs4MVk0WCsyclB4SGswN0tCSnF1WVZB?=
 =?utf-8?B?QkZ0a0Q2U2dZWXhGLzB3MEdWcnA4ck5ZeXlIRndwL1RYaEN1V09BTDNoRHpm?=
 =?utf-8?B?QytHLzF5dStDTUJpZGN4enhhcU1vek94QmNWZng0TXlOWlUxM052SlM2OWg2?=
 =?utf-8?B?VXFPZC9tQ2hXSU0xNVdZSzhNSkFWUjcwUXB4a3ZUaSthTDg1N1Q0bUEvclla?=
 =?utf-8?B?NFJxcUlBUkd4b0xmN2k3c0xGUVBwUVkvbDJnTGNqUDNDWXF0U2Q4anBzSFE3?=
 =?utf-8?B?R0dWNWpuUEtteXJXOVVQVXE2Q200SS9CYjQvNW9yNHluNXBSWUJEV3k1S3Zn?=
 =?utf-8?B?Yk5KaDlVQ05pdDFkek1RR1RrbUM4aDhLYjZVLzM5c0pvVVlNd0dVbWhudUlo?=
 =?utf-8?B?Q0dIVW90ZDN3NTRxbEY2YXFKdm1aU3krMm04WGFMMzZmQndOd0JrWEhPelB2?=
 =?utf-8?B?WWUxcEw3V0JnbHRIUVVUMkNzUnJUOGdreFFPaEs5cnJTdmNMdVNIMDBSQTJW?=
 =?utf-8?B?TGZaWVJwNHpzYlhGUkRDTDJBNXhQemp3ZldJTUR6MWVKb092SFFaSklURksw?=
 =?utf-8?B?Q1pVVzNqeWl4TDZSYkVUbVZyZ1JlQUN0RnpybXdEZWNzVTV0ZEozOFNoRC9l?=
 =?utf-8?B?VTNkMkp2SkQ3dTNJR1QrWnNncGU2aG8veDJ4SVZXVXQwRWF0Vm9rNk0rb3BP?=
 =?utf-8?B?RmI2WjY0Y3dDRVhxZnJHKzMxYU11RTEvTVJRY3ZwRE83YzdSc3JYM0J1aWNF?=
 =?utf-8?B?YmJsWWIvVzR4ZnRBcFlGbXRhZ041Y3RuVHRDeldZeTlFZ0tDSHJWVTJNZmx4?=
 =?utf-8?B?aWJpR3ZzVzRwSWEvSFBIRGNuZlMwWDhGWGZVWXRkUGgxcHBDTy9lcHloNlhp?=
 =?utf-8?B?YTZxeWU5OUVQUkw5N09xN3V2Tnd2WlQ3ZjFybjVyUlVFVVcrNUlDb1FDZVpm?=
 =?utf-8?B?QStsYmY4ZEYzcDhPQjY1QzJpYjBFREdPeGQrdWRtTmRCaUsxeUhzVEV5M1dv?=
 =?utf-8?B?aXFybEc0MHNMb0p0M05iRXNBbkhzOXZDTGQ5aHBNL2JOdTlkK1JUS0tWUWIx?=
 =?utf-8?B?STFXTFVpZURsd3JkWEVYZmovc1dJeGxYVHNLRkdKOUNmVUh6SEd5U2pSMXRN?=
 =?utf-8?B?TzA3WEIrRllpR0dDKzhYbDc0b1RzQlVZbmlBbWVMK01nN0Y1STZUTmJ4aXFT?=
 =?utf-8?B?bDR1dG04OFZLZEttMjZ3dThSSEdwS0J1a01CQkpDaUdCK2RVRWM1WkZzY1Rw?=
 =?utf-8?B?M3dSbDBRaGdNMFBkWktqZlF0SExBNWlFSWNmOTFMUmpZY1J6M1ZpTndhbjJl?=
 =?utf-8?B?OEJaQlg5L092UGpiRmozR2g0ekhCYTFkOVkzcnFjWDVIcC9QZENwQ2Y0OGNZ?=
 =?utf-8?B?VDlSMlNRMlBrT01Da05sSzF0aHlxL1ZSUWFDaXhqbTFPL093T2VLc25mMEJI?=
 =?utf-8?B?bmZBRFIrU0syQW8vTWpwQkYwM1p2aG10czJ1ZUdmbmhEa1luWmcvLytLRjE4?=
 =?utf-8?B?b0lGa2EyWVptRVluRStrYjRKaUFmSnhCcTBaOXIzSkVieG9iaW02Vy9neFJo?=
 =?utf-8?B?b2R6eEUvN2FjWG5idEdHcFlMbTMvaGQ3ZzlGZ0ZTUGZITkx4d3pDa3RmRXk4?=
 =?utf-8?B?VnFNdWZSNVRKK3ZHYzVFa1F3OStnSzBLMWtjNU9kZDBnaW5oTlliak1uUjcr?=
 =?utf-8?Q?D7TBDdFvhP/qO517HdHXH3P86?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4334.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b71a00a-aaa6-4935-5dc5-08daacdf73fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 05:54:54.9637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jn4qCwdMBZ4K7Q2wEi+m+B35oT4yXBgKhawtbBtBQWExbuN3TTtopldlbQWtqluE5PBfmfGAamqJL3Zz0LlBfSv4c9jCQufSrrw3QpENvEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6541
X-Proofpoint-GUID: m_uzBA8meAqOnZu92goeqpFdTcgsiUZi
X-Proofpoint-ORIG-GUID: m_uzBA8meAqOnZu92goeqpFdTcgsiUZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_04,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=717 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_225502_106611_5BBC3582 
X-CRM114-Status: GOOD (  16.51  )
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

>> +static void ath12k_dp_rx_process_received_packets(struct ath12k_base
>*ab,
>> +                                               struct napi_struct *napi,
>> +                                               struct sk_buff_head *msdu_list,
>> +                                               int ring_id) {
>> +     struct ieee80211_rx_status rx_status = {0};
>
>initializing just on entry seems wrong, see below
We reset the whole struct once, and reset the necessary fields alone for every loop within ath12k_dp_rx_h_ppdu or similar places as necessary
and pass the status to mac80211.
The initial reset is necessary so as to reset all unused fields. This is an optimization to not memset the struct for every loop.
>
>> +     struct ath12k_skb_rxcb *rxcb;
>> +     struct sk_buff *msdu;
>> +     struct ath12k *ar;
>> +     u8 mac_id;
>> +     int ret;
>> +
>> +     if (skb_queue_empty(msdu_list))
>> +             return;
>> +
>> +     rcu_read_lock();
>> +
>> +     while ((msdu = __skb_dequeue(msdu_list))) {
>> +             rxcb = ATH12K_SKB_RXCB(msdu);
>> +             mac_id = rxcb->mac_id;
>> +             ar = ab->pdevs[mac_id].ar;
>> +             if (!rcu_dereference(ab->pdevs_active[mac_id])) {
>> +                     dev_kfree_skb_any(msdu);
>> +                     continue;
>> +             }
>> +
>> +             if (test_bit(ATH12K_CAC_RUNNING, &ar->dev_flags)) {
>> +                     dev_kfree_skb_any(msdu);
>> +                     continue;
>> +             }
>> +
>> +             ret = ath12k_dp_rx_process_msdu(ar, msdu, msdu_list,
>> + &rx_status);
>
>you don't need to reinitialize rx_status for every iteration of the loop?
Same as above comment.
>
>> +             if (ret) {
>> +                     ath12k_dbg(ab, ATH12K_DBG_DATA,
>> +                                "Unable to process msdu %d", ret);
>> +                     dev_kfree_skb_any(msdu);
>> +                     continue;
>> +             }
>> +
>> +             ath12k_dp_rx_deliver_msdu(ar, napi, msdu, &rx_status);
>> +     }
>> +
>> +     rcu_read_unlock();
>> +}
Thanks,
Sriram.R
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

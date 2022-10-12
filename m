Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D58CC4332F
	for <ath12k@archiver.kernel.org>; Wed, 12 Oct 2022 23:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiTyZwW3dzK6xGrpRUVsDs2Gy3ykav4CA1Mzk3gXoBs=; b=VV2gCJSBO9QCzn
	QJS/gYdVCa2N9E/xlpYAwy8nLD/pWYzroWq6oaGs1rmS5cp11FYD9DzoRxcWjOK1b6vG08HKmfZgd
	C3R/RHW1TwCnoyh2xk/SXBKmTphsXmCiHDA8knRNW8Ks5Y5cLy4CpMETTR7SL5vnJRTPf21xcqENu
	i/qpVHsC6TfCdcnxTm0sjCWxVJYf2O+PxziLOjlkarX3jSG1dju6V+JupsRnO5rw2MWiAH6N1mfTG
	KuxjuylDKAEE8WtMxH3+FE5rJQ2Po18j9iWAAmHMVmbm1ikcUu/c7k0prn90OqG66JD3+tkH9qket
	bg92aRLrC7wrzON5aU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiktj-009fjW-KC
	for ath12k@archiver.kernel.org; Wed, 12 Oct 2022 23:12:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiktg-009fi5-8C
	for ath12k@lists.infradead.org; Wed, 12 Oct 2022 23:12:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CMTgGf001413;
	Wed, 12 Oct 2022 23:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=eDPo9L7TtnzZ34UlKvs10xUYXWo1Q1xbSJ36a7Tx+tk=;
 b=HIct5GxFXq2pHsUJjSgdvaKMFRRB329/hdeXLZ6ayVSnShfmU7Qo6jU2JnZTWpN/Uq1u
 nFOxKawo/xcDfmU+ToFXDlWOHf0AbKMaSEGh4Bk9DvVC3te2jiuMPyGZqiDO4Vij0F7l
 l9Md2jgbdi2/V2tUW2aoBykgZEbFVz45HcXNcyZDXmUU+5hmePt1nEuCMCoxHGMsUSRY
 XoGHWymkOUGqcLOZKnCThPReKB8sbK/T08NBrJk0MbEcBw3U2s+lb6ETB6bi1iAaZUYK
 +wpB8hzLToqMPWSw8Fuw1U2UH1SeCTZfJZsUFyWfZMsMGOnuwU8yHETvP1nqvQ5BtNhy mg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5xtf16sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 23:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVId8ZPHvTC35N3JLSi92UKsaR+LTbcnoEfEWOlDcJsYDAo7WXgW5YdTCZhdUJfGDMv7mTnsMLrxhDv0zIW2F5b5yr4+J/by2JP8stuKPYFdlc/imHtY0v3WQbb+N9130lTRiacUawiKm5z5R8K35JQ/4fGyrtQ1FhowFOiDwcvqFI1m6RlYoBbOFHAPrsdw/YEBYDcuI6ATjpXSYkPDF8MwBzEX/0M0C1Zp6ZQI1TO3rBQfnWXo+nVcTFpvDHH63y5Dw2AUS5Nto1j9HjJalpeYGsyGFdwDlAR8JavacDqlj+3/ZsNI1wFXBNLK5nwEKo0qDMqXcWQ+Ess5B38BXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDPo9L7TtnzZ34UlKvs10xUYXWo1Q1xbSJ36a7Tx+tk=;
 b=e/ilNEPuUL0tLGk0OuqAxmKuU/kHzJhTn5ORgorqOIXELmQcnQ5bQipBfj/CM22eMlu3XrNXrM6sQXCnpPO1SzQAPokgGdaqKuwAgxxSfbB6BhT9QVGmpIlgu53H6c+K6htZyRmcOop8j4m8vbpfsy1JlnKy4dxyRCvNpcckP48c4kUyL6D9Kt6UHute2CNlJx0f8lQ4SHVa9i5mBly6zSEQiE8x91s1FZ9DdzhyyBdgQbGhAzDzNoVnq6zH4DeQtxQXL4+YXN1s1wBKJYffo6XeSvTm+f0c7/MP+nHX6TUiW06ibG4NUtQIsHlZRVbnNHJAKFssp2agI98h0bVgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4334.namprd02.prod.outlook.com (2603:10b6:805:ac::20)
 by MN2PR02MB6781.namprd02.prod.outlook.com (2603:10b6:208:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.18; Wed, 12 Oct
 2022 23:12:10 +0000
Received: from SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc]) by SN6PR02MB4334.namprd02.prod.outlook.com
 ([fe80::8bd9:bdd5:901e:3afc%2]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 23:12:10 +0000
From: "Sriram R (QUIC)" <quic_srirrama@quicinc.com>
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 05/50] wifi: ath12k: add core.c
Thread-Topic: [PATCH 05/50] wifi: ath12k: add core.c
Thread-Index: AQHYrmYQb/hfAMcftEyJRue7rvMdCK3dFFqAgC6uvCA=
Date: Wed, 12 Oct 2022 23:12:09 +0000
Message-ID:  <SN6PR02MB4334D9D892AD577316C3CCBDF7229@SN6PR02MB4334.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-6-kvalo@kernel.org>
 <6cce0974d5bb40c2a2a40b4abeb41e74@realtek.com>
In-Reply-To: <6cce0974d5bb40c2a2a40b4abeb41e74@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4334:EE_|MN2PR02MB6781:EE_
x-ms-office365-filtering-correlation-id: 450072be-acf1-4fe2-99f3-08daaca730a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  45rf1OSHKVAdBgn2lFQiOXRehjb9PJ1evv1kEcH7aHwj8Nk1zcrqHkqQ26//s7jGTJynAZeIzGNn9+N+xBBa85yv2flbgUu0VhXTAMCAMq9cTY6OnadXTiqH3UD0fiv+peUjjQXPdPkllAPxyh+JMk25brhguvVNkfgIgQIFEJfOADI0Atd1XXlTNGAGbdJU7e03P6ZIP4tbH49FhPYDRsKX5R5TU+mKv3MTyeQpspaONWUweC2Khn0XiHYv/ZXj1BmGyFr0jztK0+yISuvVMthWRGCeei3Hq4teeuqPhcw0aOAFZYkNflwOAToDT+7pbUzFS6l3X+h/D2V2JuRtUm0U6VFngUAcd8GPskChnLtd1C73bFu6um1FLukvxVMhoirn+/lUZ3tNQNAUxDOIceyXXfxhS2zTq94cQ+37IvUhAFF23T9rkIqEVO3lBOmle5DrnX9frDNcGzaypJhcGjSxwv4NCzcx0hvRcpdyyPbLgXV6xry0Uei0JXNhmQPRjasduv+VQ43DSa6NKH9hqIgenHsOh4cMMOZgtNclB6stHhZoSRqNbkrwMKEmCrjfq6P5pDVuszeQBUBUQRMHb/CWDKoda4Cpj7gq48/Rv7gC/3yppEFvKyzF5Z2ZR9gIl7B3rj574Tt6qNAwJoqcUZ3T1FzDcS9F/RVuDXe16KPTHQJHsNxlz7QQ9tOvCQSf+8FbwwKcMwCZ6pPFxQYfF0M2sZJH9NquFVyL33wmgIBczOOo2nOjqd+x4UtldYETGAkvkKh1hS9c2+8FrB47Ww==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB4334.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(66446008)(38100700002)(7696005)(8676002)(4326008)(38070700005)(55016003)(41300700001)(86362001)(64756008)(6506007)(33656002)(52536014)(76116006)(8936002)(66946007)(5660300002)(9686003)(110136005)(478600001)(186003)(71200400001)(66556008)(316002)(26005)(122000001)(66476007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?RZF0EwZtUT/y8t66DZJfia3XL4cqMyx9Nvc4pE6gYiCfJ9d9MTXjKohhZlA2?=
 =?us-ascii?Q?pNLNMCh+sMn+gmjutEx6NKs6uOKJKxmLQesSpJOcoH9Y/la/dCbabGXpvVwg?=
 =?us-ascii?Q?QBUqM9nWhlr5mGh/Rdgv4cCVig98iUZMYj0bxxNgWywRzX/14Ci+bX92JGoU?=
 =?us-ascii?Q?QXDSVE9n/LB5pdAWStbYUPBu+h+mcp/abajK+7FkXjrQUlB7asGdp9hClT3k?=
 =?us-ascii?Q?1tj15sV/YnsJWB67+WGZmb3HUTAOwaa7hopA+/2LZhPCc22RQOx5KMnMJObr?=
 =?us-ascii?Q?BDYCEpy85261pzKnDDoCWW1AurwrQN50r3JuAI91RFfBAMlnH1k5+HDxE34I?=
 =?us-ascii?Q?a7k0e7gSk+9AJBtKhnRi0eRvZcuIB+IQcD8MW8tTRjvvsqE/SohOkYRlxEAH?=
 =?us-ascii?Q?1TKBZ8CxPhrVGEcV5gJ0IfR46HWLT2+ulMqkTkEaebn8ebR0BmFuh33c8rTk?=
 =?us-ascii?Q?Cx9QuVdBVgF8hot8QfLpK2ECYlADlpUvCQ1L9os6DOns5h0V+QqYvD/AGGRG?=
 =?us-ascii?Q?Mn/tMp/3v67Mt1srZJ2ykkIZ5cXC60/Bsmo60KtFp7jSCr0AHXY7t7EglXCD?=
 =?us-ascii?Q?3JqqefgNqiY2x5YzFSQOY0LLl1SGF/bRLnd15+FiIqvs8QNG4Wl6WjA/+5bo?=
 =?us-ascii?Q?N8OxdHu5FCl6xUsG8pnykKOE83bYKmDJp7OB+GQ/6XrWgeLhMprZYkzPC7qD?=
 =?us-ascii?Q?B9s6xChtckmdxcUtiW+xUHTahRG14Q+2IJr0avof/mCIgpeS//GGUMlHeQFz?=
 =?us-ascii?Q?LPnny19bL4tlt6rgPn/VO+cxwIEAF8pMlL2skraREzgr3NNzm4qvX0Vz536a?=
 =?us-ascii?Q?MydOWXGy4LmQsb9lqHSpXBzNlkoLfeSnBrgdGrTyfiUoLFGfzIF6ph/UQtqq?=
 =?us-ascii?Q?0hoKgbiAPjHCKVTmyt5t3nIln1ogPXVJ37OzEy7GAJd+eZsUpPL9ImArPPPS?=
 =?us-ascii?Q?eZq/rY4Nb1lkobUSJTSlr+325mlpBL44IHoBqdNPShaX+dUtTRXMK2s5LrRg?=
 =?us-ascii?Q?h3JBHY49y7z8oeGxU9yAOyiyMFhG140AICLt1dp0GSUr+LzshtbHbuDtsgLE?=
 =?us-ascii?Q?JYnupkbJHz4K3Xyc+2BzLx7gb+CPgR1As9JIniAyDMXvDxq28MZdR5V+HQUU?=
 =?us-ascii?Q?+ahuZR0GpbWMDw6AqYkAUO7gPVP2/DLmZ6cFFgekcDHoJIHOuy0bYVZd1NE+?=
 =?us-ascii?Q?OFPa1hDo5/gbzfRoGltzAPe/TeLcoewX50w64wlPEz0hZl2yaCkqWXARbfPK?=
 =?us-ascii?Q?4J1rOL7GwXRH4evrVajNYnlSpG+hhv9OREE+NeiEfs1UxDt/ALdtZm8ZNmHu?=
 =?us-ascii?Q?T4IpUefyKDSEfQ7DhOacx9zExGvdnwe9HeQE3R06W4jnq2e48weVcarY+l+E?=
 =?us-ascii?Q?rmv+5+H/Xo6aaprogUV1cqgOkuvulyDwjTvZAKEZfJDoyr5e/by1ymoLQPMN?=
 =?us-ascii?Q?dvtzhOvA3BMqkbuJz5AxsHwbPKXwWEmcXjEWFhCN5Iu4qsQXPXf+8NDe0+Ds?=
 =?us-ascii?Q?4Bwtf0a5E8QKr3lOBY7x/EqOJ5BwVXKC+u5rWz8AOLSZIkIBc1NV6FqT+P0V?=
 =?us-ascii?Q?gf3il+SC3m8DkXVJg74z2DdR9rwm5X2t707Ki5cW?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4334.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450072be-acf1-4fe2-99f3-08daaca730a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 23:12:10.1709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0/+eIlNC37k+J1Vq8ThERuDm1Rr3ZNsw0BGqzCeOx4fZhu8ZVLIDnU6FoPjqhpDt52QSomK6J6LAd6BrlyT71U5Jm57sDuukzf8isOLb3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6781
X-Proofpoint-GUID: Mg-VUtQxfQbC3eG5kifSmBDymPmSkHkg
X-Proofpoint-ORIG-GUID: Mg-VUtQxfQbC3eG5kifSmBDymPmSkHkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_11,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=996 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_161220_453452_81E54A42 
X-CRM114-Status: GOOD (  14.84  )
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

>> +static int ath12k_core_start(struct ath12k_base *ab,
>> +                          enum ath12k_firmware_mode mode) {
>> +     int ret;
>> +
>> +     ret = ath12k_wmi_attach(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to attach wmi: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = ath12k_htc_init(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to init htc: %d\n", ret);
>> +             goto err_wmi_detach;
>> +     }
>> +
>> +     ret = ath12k_hif_start(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to start HIF: %d\n", ret);
>> +             goto err_wmi_detach;
>> +     }
>> +
>> +     ret = ath12k_htc_wait_target(&ab->htc);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to connect to HTC: %d\n", ret);
>> +             goto err_hif_stop;
>> +     }
>> +
>> +     ret = ath12k_dp_htt_connect(&ab->dp);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to connect to HTT: %d\n", ret);
>> +             goto err_hif_stop;
>> +     }
>> +
>> +     ret = ath12k_wmi_connect(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to connect wmi: %d\n", ret);
>> +             goto err_hif_stop;
>> +     }
>> +
>> +     ret = ath12k_htc_start(&ab->htc);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to start HTC: %d\n", ret);
>> +             goto err_hif_stop;
>> +     }
>> +
>> +     ret = ath12k_wmi_wait_for_service_ready(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to receive wmi service ready event: %d\n",
>> +                        ret);
>> +             goto err_hif_stop;
>> +     }
>> +
>> +     ret = ath12k_mac_allocate(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to create new hw device with mac80211
>:%d\n",
>> +                        ret);
>> +             goto err_hif_stop;
>> +     }
>> +
>> +     ath12k_dp_cc_config(ab);
>> +
>> +     ath12k_dp_pdev_pre_alloc(ab);
>> +
>> +     ret = ath12k_dp_rx_pdev_reo_setup(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to initialize reo destination rings: %d\n",
>ret);
>> +             goto err_mac_destroy;
>> +     }
>> +
>> +     ret = ath12k_wmi_cmd_init(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to send wmi init cmd: %d\n", ret);
>> +             goto err_reo_cleanup;
>> +     }
>> +
>> +     ret = ath12k_wmi_wait_for_unified_ready(ab);
>> +     if (ret) {
>> +             ath12k_err(ab, "failed to receive wmi unified ready event: %d\n",
>> +                        ret);
>> +             goto err_reo_cleanup;
>> +     }
>> +
>> +     /* put hardware to DBS mode */
>> +     if (ab->hw_params->single_pdev_only) {
>> +             ret = ath12k_wmi_set_hw_mode(ab,
>WMI_HOST_HW_MODE_DBS);
>> +             if (ret) {
>> +                     ath12k_err(ab, "failed to send dbs mode: %d\n", ret);
>> +                     goto err_hif_stop;
>
>Should it goto err_reo_cleanup?
Right. Will fix it. Thanks.

Sriram.R

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

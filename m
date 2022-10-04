Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECDFC433FE
	for <ath12k@archiver.kernel.org>; Tue,  4 Oct 2022 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2m9nax+OtNlvgghU0OSZjzkKgv0np7MRp14duESlPrU=; b=BzOByydGqKnitY
	H2gVuYXjTEYBiG/auS6jhGRQIhXAlCovgMY8ZVfT3l7lqtC+khQN0potIzqnif/9KcGAo0mkpLx2S
	9GeeaOeVxp6jCftPyckgj2rj8kDiocYcjawGH7DDP6SBVttIyAi24/6nIa7CsFdo+BuVeHPfAIE9u
	Suxc6TR3WfT8nJf6W3ZImThx/qHHtKUrZdH863XBPB+kQ76j2MbIXKEUDl3K2ytd0lvhmkRhMGgmV
	JLh3A/BSZJBvztqjbCd210Kb7QGdSBAFWarVPdHR8XtKJNLcm0Qa/6tCXPGUtgepyJNiCShBj9QV+
	q1quUIY7pdiCxG1CL2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offyP-009V93-Rm
	for ath12k@archiver.kernel.org; Tue, 04 Oct 2022 11:20:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offyN-009V8h-0q
	for ath12k@lists.infradead.org; Tue, 04 Oct 2022 11:20:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294AAb3D001337;
	Tue, 4 Oct 2022 11:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=RclafjPNZrOz7LgbsDfvYjiIA6GzKjfy+6bszJ1k94w=;
 b=cCSavNxpMNA3ZTKuuKsu0Baol786j8Piu93pcruXUOmgo6x7xhlBZ4to2eaKrkKI/lU+
 U1+xYYFAG5NSF7sRm/L1RudpC7Fzy0q7yAJowMguCDYBjdBES0p2e8TNZvYBSfaSSibI
 Hx6SOfw1iWH+VBzSiUPPrBfFrYtyWYrv5gcYhDw2gZ4JHHyGOE2gppmGX5TWG0ZdsZme
 zOhs7sbPWqCZxuZzAyFZDVZVFyYolAx1+qRlQYJtAdoghHKnmUImTBB9hQcl3lCuKEiq
 innw6Z3MlVBRsUA0vWsPgg9337GrN9wNPge2TdhmxjCNEbFvj+I1w7TAgL8MReVI05YR Mw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0hxpr6dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Oct 2022 11:20:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pggw2AhWCZUjr7Jm3hva8Swkhfvm/0dFPwVI225rbNA9FvKNQzPp5U34tbW27kQDz5DxfGdcrOkhF46dZFMXMLtXFLUFrBYIibnGDlq4qsqmu6p/XLcP3ukb3HiEOogp5jyB6bC3xukAI668wnJ5RZEQ0N1Dw62FVP8yVF6K/Ynsv/UsnpNeIoUihc6NSQbzpRd9j/aTfy7T8dtUn0hFiTzZ2bRBC2rU28ZU7eaU795jGJwnt8QLDfC4cIKYlKLiEsEw5BCmYNoDa+Ub0DLXhnbnB4H7Q/67IMe/sLqHJReksB8kOMmVlbDBLgRadAjJ2vAfoO+u1znyi8owDRRH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RclafjPNZrOz7LgbsDfvYjiIA6GzKjfy+6bszJ1k94w=;
 b=JZJy/KFk4EP04RDoaIPLZnlsFE+ewkQny9GsyvDtfTmiaRcDHA2JBwlGfbxFa6qNgrwF03iz28tmWu5QhOWPtui7f1GToa3dYmANAfSI3OEG4s0SVgD+19+4l2HeolZHQCXduS23EFjFCO40JTYK/QO+GdRpTbdWMt6UyT5KgTGn2ZHKgSXaaXsDbvCmayYi1KWPe0PzIq+1ttTvFLH+O1rqO7KaYOYfA/yjVHUIfBWePTY7zTSYhBtYjoTiNgPS4Z4Ea3I9DguUDcZuL0bTlUMy5oByGExBED/Yxkm3lhWKUauNiwu04r7dXS2bcYHvJKAnTqztkCWyX/LfriTOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by BY5PR02MB6626.namprd02.prod.outlook.com (2603:10b6:a03:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 11:20:20 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::a2aa:7ce8:a34:fdb1%6]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:20:19 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: RE: [PATCH 24/50] wifi: ath12k: add hal_tx.c
Thread-Topic: [PATCH 24/50] wifi: ath12k: add hal_tx.c
Thread-Index: AQHYrmYa8kklSHWo402I5xBYr4DwZ6208QOAgEl3kGA=
Date: Tue, 4 Oct 2022 11:20:19 +0000
Message-ID:  <CH0PR02MB8212676D9E8EF6854370AF8AF65A9@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-25-kvalo@kernel.org>
 <a48aef94-027f-562b-76ca-8b49c15c5c9c@quicinc.com>
In-Reply-To: <a48aef94-027f-562b-76ca-8b49c15c5c9c@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB8212:EE_|BY5PR02MB6626:EE_
x-ms-office365-filtering-correlation-id: ebeab960-116c-4fb0-dd7c-08daa5fa6bfd
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CDi8GOPUct/ehRYVDxmamG0wGSNqWo3j6GM4dKdomM76DLDIBAYdFFz1m1YuLsXbri8eqcT3ZAwt8M0IQnTCl2rw23Rln+TVRkOiS2SyN57nByiRK7/355OpiehsHcXkQ5wEoDVKJQPCH/Zk/TCoH/nwimyqLBpN1yhfRZI+EuaBrgQih49lpuZZd8SoKertDAm2HHfWW3IOjEagV2lgy5qxneix8wTwxnVWL2uXINFQwh6et5UUI53NBbHygxSF+MQZBwzURQNcNbgleDDLSJB2M46idwvu0piU3I7Kc5+l43zT3xqxN6w5NcJSOrAcdOEst6yRmqx9t8QElS6Df4bnIJclyr2sCHvkRhc9BY8E77z/0ej/IXA2ngy56vX4L+MIXKaxB/wF+a0+BWNwXEdJyUapH2jFS0oxJ+fZc16sd4UJzsj97QjekjKEdbYdyNbL+c3pdRIyN4u+W7oeEvgsH3Ra8hRz0wwNHqtn9JzJUR5sksyM1yzkQwMqvsa5P7+xu7x9ojdlGyRw9gfPUjxHEkRcT13YcP2RKgOr2Rxaq7Q7LH0JuiU9PwqoFtroYrHmoes8rttXNDw55XKkATIh6qDsVCQ1XCubckzSg50VKN0FdeVf/qbmZSBFwwk0AyGeOvTTvGGRlk55OVtSNnOeEfLTotBX3NxwcQueS9SPBbS+9pEtyWwFaRZFqSRr3HgJRV5oKM6V7Q9zUsmHZ/a9R5ojhBy8ju2tc83zgfILA8THlcE3qa3yj7syP2fwC47wKqAB/Fc33mK8Sf3x0w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB8212.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199015)(122000001)(38100700002)(8936002)(7696005)(9686003)(6506007)(2906002)(186003)(5660300002)(55016003)(52536014)(110136005)(316002)(86362001)(41300700001)(33656002)(71200400001)(53546011)(478600001)(66476007)(26005)(66556008)(8676002)(83380400001)(66946007)(38070700005)(4326008)(76116006)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TE41bTVEM1FuZFJyWi9wbzlOMzF6YUdzUkdCMDkzc052clk4YmdzUDVSQ3Ay?=
 =?utf-8?B?Q1RzLzN4MEYvazJtM25rV3dhY1dXdTBkbDFVMDRHY0JMcjJ2N1k0ZytTYm9J?=
 =?utf-8?B?NzIrZ2hpTXhESWdVTDJOOHlpbW1NQjdjSGpKeGh1L3VTc2dSem9ybU0reTlO?=
 =?utf-8?B?c090QndzeHl5ai8xR013TFZqZlFRK0JIUU5samltc0JHNEdwNTdmbWpveXBQ?=
 =?utf-8?B?aTU1TFh5bmxOZURjUFhLMEpFRGlvV3I4b2c5d1E3QUI2Y2M4ck5xZEluMlQr?=
 =?utf-8?B?NWdVY1I4bUMrd1VJVkpacEg0QVR6LzVYYTAzS3dRbDd0SXZVR3ZJUHVYMkVX?=
 =?utf-8?B?RHVVRFIwTkQ0ZGNsYzlZTEc3KzhDa3RBbVhBVGJObEFlU0M1YiswR1UzcWVG?=
 =?utf-8?B?Y0ZNYlNMaVpRQUdmT0JPbHhQOGNFNEZ5Y3FRcnZESnlnTGJ2OVNNbDMxR2dv?=
 =?utf-8?B?RlpHd2c5V0ROck96UDlCaUM0L1JLZ1FyV2k3SGZMQ3hHTHBEUWF4d0tTOFhh?=
 =?utf-8?B?d0V4bzhFajFMMWZrYmUrY0hKcHUxMXJkbjd3ZXg0V2VaUW9CcE9sZzBUL2VJ?=
 =?utf-8?B?U01nZ3pIWlh3M1pUaXg3OHpZUDhuQUx0dTR2MXBLQ3FIRk1sQitPVnpaRWh0?=
 =?utf-8?B?cGE0SWpreXF4Yjh0U0xrdkR4SDlQT0lvV2FhS1NTd2E4ell6TW1FYjFuY3N6?=
 =?utf-8?B?NG0xODlCWjU4WTR4cjdFTFBNYkxLNVViS0MwRFl1alFiYlZYeWs2TUJYVFp3?=
 =?utf-8?B?MER3bDJDdnZJNjZ6VVZMcFB1SklDWG03QVdxbjVrVHliMFZDalJLbmZHYmNn?=
 =?utf-8?B?VHpvdXVYZ3hhVUZXVDVQa1h6V0NKazVTWU03cWI1WWt3SC9qeDg3Z0lhZ05s?=
 =?utf-8?B?UVZNdHNMTDBETlZJQmVzUUJpZXlGQlY3OXo1a1ZRTkZIZWpRc2c0ODhzZG92?=
 =?utf-8?B?UDg3M3JjSE9hK1pnRExQREhydXhzd2JGNEhaU0lBVUhvNXlTc2hRZmIrQUJn?=
 =?utf-8?B?Mmhsc1BhWlFqWmlrR3V3VEdQMXcvRS9YbkE1bUlsWHZaUHpOWmtNK2t0UDhE?=
 =?utf-8?B?c2Q0SnRmWjNFa2UwRG91WTFCb2ZkUHhCWHJPQnVkSWQzc0cxM2FucEI5ZkFv?=
 =?utf-8?B?OC9qK0dUbXJPN1NCVDNlajJEQUZ1MDZIYXVCT1I3S1pBSDh2QWpzd2xsWEpY?=
 =?utf-8?B?c1R6UTl2SEtmdWFtUENrRC9yTmRScThUU0sraGphcC9YWTRnekNZZVVkL29L?=
 =?utf-8?B?c0xlZ2xVTFd0NHNUVkJ2RE5SWkc2c0M5K3ZoYWRLL0VPR2kwNUF3V3FuMFQ5?=
 =?utf-8?B?L1c0Z0MwWUFJU3VJdEY3RXM5Z211OTdqWXRLN3NWeXFTQ1NLR0ZxdVJiWnlC?=
 =?utf-8?B?NUJPQ2pxMlZGWEFvckQ2cndHOC9lZlVOYnphd1l5cEJVTHJZeUZRSkNtN2ox?=
 =?utf-8?B?SUJtc00rVDlvYzczMjM4bVRZNUFBeVVEV3o2SEl0S0duU2xlVSszcUhJYUp4?=
 =?utf-8?B?d1o5bTRUYzdaNWJDWlBIcEtFcXI0M09heHlJMWNZQnlpMTdpazdtSUVWazQ4?=
 =?utf-8?B?UGliZzJJakJIamNZaHI1U3ZOaXhFOFZrQ0pXYVpCME5HeW1RSnhnUnlyUFdl?=
 =?utf-8?B?VWhZbUk3QzRLbnM1bkF6ODFiQkxsai9EUDFFN2FwRG54cTlsWGttUktES2tT?=
 =?utf-8?B?WHF3cnZ5SUNESUhSSEYveWwxbkttVXFvT2hGSVg5Zk1zcWx1QTErVjV5M1Av?=
 =?utf-8?B?cjRpc3UvK2JHOVQ3TTdZWExNSm1aeW4wcUZZcW1jUEY4VUNKaDlBWCtzdTZ4?=
 =?utf-8?B?ZU45WjlwSjlCYlBJbUk3L3ZDejhkVGQ2dUlzZUpLT3BBY1JENndDeTFZckFW?=
 =?utf-8?B?MnU1UmZpZkZzQUtOcmVHeGhNZDFnb3FBUm5PQVZtbFk0Um1COVBjUGZtRTlI?=
 =?utf-8?B?aVNHUHZsb29MdnNwSU1XMloycHVMMWtMM0QvekZNYVFIbThlZFFCSXJOQmdE?=
 =?utf-8?B?QTRTcjdVVDlLUUE3NDcvV3pCd3BrcG5ZNHFjcEVIMVg5cnRXVWJSYXprb1lP?=
 =?utf-8?B?L3BmanVZMDNIS3I3T3pjaXdUWklhSTZqdGZCWjJZQTlVV3JIZTF5b0dDbFhJ?=
 =?utf-8?Q?6TSQ+ulemEfjFHbw3gbcrohdh?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebeab960-116c-4fb0-dd7c-08daa5fa6bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:20:19.8240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MN8dF4E5H8lRJajOq/tXcAO+97Khxh1UfSx0DFDJUw4QMAU5BhhwuKVpRpJ0sCgQhNlBcgCaokj8qxk9rbHTSj3y4hMbPSPxQI24R8PBjS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6626
X-Proofpoint-GUID: LOWjrH6wdbIlYHZ7ldOSX-zgIn8cRmkw
X-Proofpoint-ORIG-GUID: LOWjrH6wdbIlYHZ7ldOSX-zgIn8cRmkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxlogscore=813 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_042027_097251_8497FB8C 
X-CRM114-Status: GOOD (  32.48  )
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
> Sent: Thursday, August 18, 2022 10:51 PM
> To: Kalle Valo <kvalo@kernel.org>; linux-wireless@vger.kernel.org
> Cc: ath12k@lists.infradead.org
> Subject: Re: [PATCH 24/50] wifi: ath12k: add hal_tx.c
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
> >   drivers/net/wireless/ath/ath12k/hal_tx.c | 137
> +++++++++++++++++++++++++++++++
> >   1 file changed, 137 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/hal_tx.c
> > b/drivers/net/wireless/ath/ath12k/hal_tx.c
> > new file mode 100644
> > index 000000000000..ac6f83ec06c2
> > --- /dev/null
> > +++ b/drivers/net/wireless/ath/ath12k/hal_tx.c
> > @@ -0,0 +1,137 @@
> > +// SPDX-License-Identifier: BSD-3-Clause-Clear
> > +/*
> > + * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights
> reserved.
> > + */
> > +
> > +#include "hal_desc.h"
> > +#include "hal.h"
> > +#include "hal_tx.h"
> > +#include "hif.h"
> > +
> > +#define DSCP_TID_MAP_TBL_ENTRY_SIZE 64
> > +
> > +/* dscp_tid_map - Default DSCP-TID mapping
> > + *
> > + * DSCP        TID
> > + * 000000      0
> 
> this comment confused me more than it helped me IMO this would be a
> much better comment like:
>   * 000xxx      0
> 

Sure will address this comment in the next version of the patch

> > + * 001000      1
> > + * 010000      2
> > + * 011000      3
> > + * 100000      4
> > + * 101000      5
> > + * 110000      6
> > + * 111000      7
> > + */
> > +static const u8 dscp_tid_map[DSCP_TID_MAP_TBL_ENTRY_SIZE] = {
> > +     0, 0, 0, 0, 0, 0, 0, 0,
> > +     1, 1, 1, 1, 1, 1, 1, 1,
> > +     2, 2, 2, 2, 2, 2, 2, 2,
> > +     3, 3, 3, 3, 3, 3, 3, 3,
> > +     4, 4, 4, 4, 4, 4, 4, 4,
> > +     5, 5, 5, 5, 5, 5, 5, 5,
> > +     6, 6, 6, 6, 6, 6, 6, 6,
> > +     7, 7, 7, 7, 7, 7, 7, 7,
> > +};
> 
> is a lookup table "better" than a simple:
> static inline u8 dscp2tid(u8 dscp)
> {
>         return dscp >> 3;
> }
> 

Sure will address this comment in the next version of the patch

> > +
> > +void ath12k_hal_tx_cmd_desc_setup(struct ath12k_base *ab,
> > +                               struct hal_tcl_data_cmd *tcl_cmd,
> > +                               struct hal_tx_info *ti) {
> > +     tcl_cmd->buf_addr_info.info0 =
> > +             le32_encode_bits(ti->paddr, BUFFER_ADDR_INFO0_ADDR);
> > +     tcl_cmd->buf_addr_info.info1 =
> > +             le32_encode_bits(((uint64_t)ti->paddr >>
> HAL_ADDR_MSB_REG_SHIFT),
> > +                              BUFFER_ADDR_INFO1_ADDR);
> > +     tcl_cmd->buf_addr_info.info1 |=
> > +             le32_encode_bits((ti->rbm_id),
> BUFFER_ADDR_INFO1_RET_BUF_MGR) |
> > +             le32_encode_bits(ti->desc_id,
> > +BUFFER_ADDR_INFO1_SW_COOKIE);
> > +
> > +     tcl_cmd->info0 =
> > +             le32_encode_bits(ti->type,
> HAL_TCL_DATA_CMD_INFO0_DESC_TYPE) |
> > +             le32_encode_bits(ti->bank_id,
> > + HAL_TCL_DATA_CMD_INFO0_BANK_ID);
> > +
> > +     tcl_cmd->info1 =
> > +             le32_encode_bits(ti->meta_data_flags,
> > +                              HAL_TCL_DATA_CMD_INFO1_CMD_NUM);
> > +
> > +     tcl_cmd->info2 = cpu_to_le32(ti->flags0) |
> > +             le32_encode_bits(ti->data_len,
> HAL_TCL_DATA_CMD_INFO2_DATA_LEN) |
> > +             le32_encode_bits(ti->pkt_offset,
> > + HAL_TCL_DATA_CMD_INFO2_PKT_OFFSET);
> > +
> > +     tcl_cmd->info3 = cpu_to_le32(ti->flags1) |
> > +             le32_encode_bits(ti->tid, HAL_TCL_DATA_CMD_INFO3_TID) |
> > +             le32_encode_bits(ti->lmac_id,
> HAL_TCL_DATA_CMD_INFO3_PMAC_ID) |
> > +             le32_encode_bits(ti->vdev_id,
> > + HAL_TCL_DATA_CMD_INFO3_VDEV_ID);
> > +
> > +     tcl_cmd->info4 = le32_encode_bits(ti->bss_ast_idx,
> > +                                       HAL_TCL_DATA_CMD_INFO4_SEARCH_INDEX) |
> > +                      le32_encode_bits(ti->bss_ast_hash,
> > +                                       HAL_TCL_DATA_CMD_INFO4_CACHE_SET_NUM);
> > +     tcl_cmd->info5 = 0;
> > +}
> > +
> > +void ath12k_hal_tx_set_dscp_tid_map(struct ath12k_base *ab, int id) {
> > +     u32 ctrl_reg_val;
> > +     u32 addr;
> > +     u8 hw_map_val[HAL_DSCP_TID_TBL_SIZE];
> > +     int i;
> > +     u32 value;
> > +     int cnt = 0;
> > +
> > +     ctrl_reg_val = ath12k_hif_read32(ab,
> HAL_SEQ_WCSS_UMAC_TCL_REG +
> > +                                      HAL_TCL1_RING_CMN_CTRL_REG);
> > +     /* Enable read/write access */
> > +     ctrl_reg_val |=
> HAL_TCL1_RING_CMN_CTRL_DSCP_TID_MAP_PROG_EN;
> > +     ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
> > +                        HAL_TCL1_RING_CMN_CTRL_REG, ctrl_reg_val);
> > +
> > +     addr = HAL_SEQ_WCSS_UMAC_TCL_REG +
> HAL_TCL1_RING_DSCP_TID_MAP +
> > +            (4 * id * (HAL_DSCP_TID_TBL_SIZE / 4));
> > +
> > +     /* Configure each DSCP-TID mapping in three bits there by configure
> > +      * three bytes in an iteration.
> > +      */
> > +     for (i = 0; i < DSCP_TID_MAP_TBL_ENTRY_SIZE; i += 8) {
> > +             value = u32_encode_bits(dscp_tid_map[i],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP0) |
> > +                     u32_encode_bits(dscp_tid_map[i + 1],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP1) |
> > +                     u32_encode_bits(dscp_tid_map[i + 2],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP2) |
> > +                     u32_encode_bits(dscp_tid_map[i + 3],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP3) |
> > +                     u32_encode_bits(dscp_tid_map[i + 4],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP4) |
> > +                     u32_encode_bits(dscp_tid_map[i + 5],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP5) |
> > +                     u32_encode_bits(dscp_tid_map[i + 6],
> > +                                     HAL_TCL1_RING_FIELD_DSCP_TID_MAP6) |
> > +                     u32_encode_bits(dscp_tid_map[i + 7],
> > +
> > + HAL_TCL1_RING_FIELD_DSCP_TID_MAP7);
> > +
> > +             memcpy(&hw_map_val[cnt], &value, 3);
> > +             cnt += 3;
> > +     }
> 
> since everything used to create hw_map_val[] is invariant, why not just have
> a static const array of the final values and get rid of the loop above?
> 

Instead of have final values static we can have the DSCP (Differentiated Services Field Codepoints) to TID mapping as static.
And the final value is derivate based on hardware configuration, so its not scalable in future if some change needs.

> > +
> > +     for (i = 0; i < HAL_DSCP_TID_TBL_SIZE; i += 4) {
> > +             ath12k_hif_write32(ab, addr, *(u32 *)&hw_map_val[i]);
> > +             addr += 4;
> > +     }
> > +
> > +     /* Disable read/write access */
> > +     ctrl_reg_val = ath12k_hif_read32(ab,
> HAL_SEQ_WCSS_UMAC_TCL_REG +
> > +                                      HAL_TCL1_RING_CMN_CTRL_REG);
> > +     ctrl_reg_val &=
> ~HAL_TCL1_RING_CMN_CTRL_DSCP_TID_MAP_PROG_EN;
> > +     ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_TCL_REG +
> > +                        HAL_TCL1_RING_CMN_CTRL_REG,
> > +                        ctrl_reg_val); }
> > +
> > +void ath12k_hal_tx_configure_bank_register(struct ath12k_base *ab, u32
> bank_config,
> > +                                        u8 bank_id) {
> > +     ath12k_hif_write32(ab, HAL_TCL_SW_CONFIG_BANK_ADDR + 4 *
> bank_id,
> > +                        bank_config); }
> >

Thanks
Karthikeyan
-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

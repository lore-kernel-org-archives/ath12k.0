Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D617C4332F
	for <ath12k@archiver.kernel.org>; Mon, 13 Nov 2023 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kxR2m9ikaMXjKEzVLK6/8wCTl95ofjG89VZWTtljGk=; b=ZWVDPARk/56vqK
	GpTNW/7x5E+KDYAX48m86mivbPhnZHU852KqqFa3ZE+BJ1ILJFLclm5dIJndUS0wP9YNPPhsEP9Eq
	QRZM4+nGerkBItwqNmmhgv1HNl4YRlRpLYuVHCCq2Ag5HwATXax+0pNsReN7keRwcitWS2tKGRqNF
	NykpdFwhKzNYYkmS+rOLnk8vcRBRG8L6+Goltb7WTbDDXAec7VqLoB49FCfcTpywVgG6vM3kstqpG
	1m4YCyBoy54+IgBjP4iLDZF1Hpq8Fb5mNIJIB0CKanJ8blHO5hJ3tnwa3O4n5SbEh+V0OJ7+Oxsp/
	74uDtg+oC54KEgOjd9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Yl5-00EE7d-2y
	for ath12k@archiver.kernel.org;
	Mon, 13 Nov 2023 15:21:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Yl3-00EE75-0X
	for ath12k@lists.infradead.org;
	Mon, 13 Nov 2023 15:21:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADF0IIk032269;
	Mon, 13 Nov 2023 15:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=debXK1PaVGRzfnKQyUUKWjBMel59O7KTqMmw/5MoAS8=;
 b=m57exFHnPDm1+aiIrUPY7HCinLmZ8sZjnijXF9pR1jnZFYQxAgnNLRUcBSSllR2xY6iE
 y34taAeaBWCCPIoCAXq49cXgqv6g2+ItVjJm6S8E98vd7vQLYGXFNWKWmd7m0MbhNlRA
 7V+PhH+q0Sn3/NSROGHZKpmxN1kazyR9d5dKIjtRFft0mgz2gPG3fkWTk/4a5/pNLDTc
 T40GUldyKwVz1cBoy0C8ah2o6siklxJiSXqv6S8+Z8OWFaTlf37DyK2XXUJ3raWRZFi3
 A8G9jdPeqjrmqYRpbne93oiP1LnBg75CR5mZb96eAl1ZrbWQ64vlUiGCacfh6r9tgBq6 rg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ubmtv88cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:21:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ADFLlWE023398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:21:47 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 07:21:47 -0800
Message-ID: <2f2709a9-481f-403b-b4e3-37d11e8703e2@quicinc.com>
Date: Mon, 13 Nov 2023 07:21:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: avoid explicit mac id argument in
 Rxdma replenish
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231111043934.20485-1-quic_periyasa@quicinc.com>
 <20231111043934.20485-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231111043934.20485-2-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gFgFFNkVqOqZWF3Su-SAP6nnKT-eCMlu
X-Proofpoint-GUID: gFgFFNkVqOqZWF3Su-SAP6nnKT-eCMlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_06,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=8 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=8 clxscore=1015
 spamscore=8 mlxlogscore=106 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_072149_208878_D86DD53E 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/10/2023 8:39 PM, Karthikeyan Periyasamy wrote:
> Currently all Rxdma replenish callers pass zero for the mac id
> argument, so make it as zero implicitly. To optimize the rx
> data path per packet, avoid the explicit unnecessary argument
> in Rxdma replenish function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

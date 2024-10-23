Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31961CFA45C
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b50UQFeHeo+8nfQnP6vmevfiqE/cxmki1RMuFJHmpMk=; b=ETgAH2IncJW0NxzeD/X21/HOrA
	AMHGF2eVtUPJK7qcfa5+X6rjq4EozRmFUQgpyZ+3HygX08LFy/1DgAVbhwQDhBmnorG0jZaqRgo0P
	JVsDArrv5qaMZSQBkm5vo41Si57VezcCa07i/Vc4+5ANclGi5a1nPvkN9LOrbx9OCMNvSTJWt7SPb
	koSKziv7FVO3xdpJQ3yVuDWYB2cblRJbM+ECTo721ACbj7TxaNXQwpDbvtvHhsZZLBESSmU7sBSMQ
	ExgXF7Ylro5WIGBEZxImFB1z/Ne1hZ+DS6tRVNy6uPoXCOOhVf7tGJCKR8F7i2Fa9se999CZD/fYR
	QMYaKZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g1R-0000000FVsg-3e6x
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 18:23:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ewP-0000000FKzH-1fiR
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 17:14:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9Xgcm023430;
	Wed, 23 Oct 2024 17:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b50UQFeHeo+8nfQnP6vmevfiqE/cxmki1RMuFJHmpMk=; b=VXRKo2UPUemox/u4
	GONQdKqjjwyD8oC0el2rKEK+3OvWgoHmS/x5HRIQmKtWdrVtmwt1z1+b2vKPnBCE
	Afj0cTIxgwi/w447zaOVSvqBRMZYzY1aZHXT+fBVhku+tqu/LYb2j9nn6R84Gvwe
	rMBjL4GKnX+RMVcfYo9BAl8g2+bs3SkWTk8P70ND69yS2Eiq6EB85sULiGbNYb4i
	kaPMGPC7sey5/yGl0dGZIv8KTlKGYo5uj/Q7jrBFkB+PV0fwz7JuLlKc6Piotk2l
	ERtqIlOh6mIRntKllpKgL6kwTMNFLV6+aJDwDGjTumwFkZPop+atvTxO2xE5weju
	35sMDQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3uk09s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:14:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NHEZ9g031840
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:14:35 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 10:14:35 -0700
Message-ID: <d5fffc97-2603-4614-95cd-333c86435534@quicinc.com>
Date: Wed, 23 Oct 2024 10:14:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: convert tasklet to BH workqueue for CE
 interrupts
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241022072406.3231450-1-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241022072406.3231450-1-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: myfcHx0R0gVULm6zUE2y67Abqzfn9oJr
X-Proofpoint-ORIG-GUID: myfcHx0R0gVULm6zUE2y67Abqzfn9oJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=906
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_101437_516226_E2034395 
X-CRM114-Status: UNSURE (   8.26  )
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

On 10/22/2024 12:24 AM, Raj Kumar Bhagat wrote:
> Currently in Ath12k, tasklet is used to handle the BH context of CE
> interrupts. However the tasklet is marked deprecated and has some
> design flaws. To replace tasklets, BH workqueue support has been
> added. BH workqueue behaves similarly to regular workqueues except
> that the queued work items are executed in the BH context.
> 
> Hence, convert the tasklet to BH workqueue for handling CE interrupts
> in the BH context.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

(Not sure how to stress-test this, but it does survive multiple rmmod/insmod
with a Youtube video stream running)



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BF7C27C4F
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 15:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoVR0f8c5XaTly5lMjRvh2GcUnOM3ExOJ5sNDJHMFsc=; b=juO0e6VXrRkt2DR2lB2IzwEdeZ
	VVUOMawE/gO0HnMmWMcxQSbAdUBsVyaPndeNXodwMjkOILtE8efYhtuQZV/0ywQ+H5MF7hfWmL4aE
	WLbCJLVmwsFOp1jFC8h76bmKlUojI2dSWMER7BMX05k80lHDMJ+w/a0iy3J6lVTiSwaAA1EXxE7mC
	b9tDg6zBidsqwvdVYw6SNo4vi+0iRzAjsJzgORBVDFPRifaANpYnxO8vXX1dmCrsor9iwlrPlCxC2
	v2fH8xHbLIaJpzUMqZAJ3VjpgU2nfY/IrHE1PwJBC1M7NMYaqptMjFoR0U/JiXug8HA0IucDb4kMY
	fHosRMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUbq-00000007PBF-1RvT
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 15:30:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUbl-00000007PAD-3eaO;
	Wed, 26 Jun 2024 15:30:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfjkY029578;
	Wed, 26 Jun 2024 15:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AoVR0f8c5XaTly5lMjRvh2GcUnOM3ExOJ5sNDJHMFsc=; b=Ww/8UWnzXLjinOuH
	IBGSbvxE1yCkJq+/Nyo4JlPwZvTXD+bcF3417RmiY+PhBrTXFnOVvPIcqAXztRp2
	GzCN9+y8GxgM/RprYhJ5Z+9H+9POd790hp/sWQUwHAjQRkPiboNKzR3aYJ3kT2kI
	3OS8e2k60F86YJ3AVbWS1TPE8r9QQ4HfWxXftgPfGc5/c78WtXwozSn8L2xNmRFH
	s4vOVGP2NEbKdAnkvGsSfrPrhpywt1HaBL8rISdwisGo4Mzk5aiwKxkSd4brzOd/
	C9GVOXw1cKYqHdjkqXUuMO8LBl0vg6MkTXFCCaYRz94melA6q9k5n9l9Qi5/bm2C
	NPv7zw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6sp10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 15:30:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QFUnDt024866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 15:30:49 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 08:30:48 -0700
Message-ID: <bf4f7295-fb25-401b-b9ae-6c0fab758ce6@quicinc.com>
Date: Wed, 26 Jun 2024 08:30:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] MAINTAINERS: wifi: update ath.git location
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240626102632.1554485-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240626102632.1554485-1-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uBuSAKqJ3V8LeYN0z97DHBsI5P66HALB
X-Proofpoint-ORIG-GUID: uBuSAKqJ3V8LeYN0z97DHBsI5P66HALB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=886 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_083054_080785_DC241031 
X-CRM114-Status: UNSURE (   8.67  )
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

On 6/26/2024 3:26 AM, Kalle Valo wrote:
> ath.git tree has moved to a new location. The old location will be an alias to
> the new location and will work at least until end of 2024, but best to update
> git trees already now.
> 
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



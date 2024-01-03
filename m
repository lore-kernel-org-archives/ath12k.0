Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A930C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7DYAn7SsmoaqSt/P7dUEFUdW0UYI1yu/GFPxwuzkMc=; b=oPUdZmGFALVg6rNFaLESKM60kU
	hHFgmh/TgmyccTkQjaC0KMR7kCzKlWzRpcjXkv/TTUwTbNIgyRxwQ7zXbAPFnLLargVMEtAlhjb/j
	9DhJE9kf0vDsv1uN+U2djVGznG3q4zUHXIn2xXoos9OwDxEmlTJU4q/JU7847611kG/RhYSeKlCnD
	LG+r2KnBPEApCNBHr7gZkbk8L+j7EdzSji8b/eJs4Wz5czFN0UQrER1IRj8A9j36WWdnsWwCW0qG/
	8M022716IGNeC8Juzeu291S1F1tBxr5lTeLH2l6pQ/fz9RUGePB4vunhGlRzATh+iR6IAcCmN3DyP
	ybGzPahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL55K-00BWmi-3C
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 17:31:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL55I-00BWm5-2Z
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 17:31:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 403GdFr8026997;
	Wed, 3 Jan 2024 17:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=I7DYAn7SsmoaqSt/P7dUEFUdW0UYI1yu/GFPxwuzkMc=; b=I8
	DS3o2R4LiFm9vkn+ZFM/BxDQW4Q8Mj7h+TaBNfNFR3QHh9A9fK7YW3aEuZDT7ubV
	VvIFCpBJ07ASlGxk2DNTuedPqu5xJvWTmTOxs41MxbKbnsa5v+sfkcutJ0zuNBse
	WUa+aBrud9pnxIFh5pLNwmXJ8sdeBgnnPOY+RD11nVaZFkl8Pmw901eE62tTp4jo
	Mb8hVAU5lXK+qoCf2DqaoWq4yj37jD1k1aRRlX5WWRhqNWl/PFLEAC80U+ymCaMY
	HxExk/4cBHc8aMRqwXOqOgbCxWEFu2JGQd3tC2ipakydQUSLyWreRVXUems6E7VG
	q08TJyGbt/Wo7AXJulCA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd27yhjx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 17:31:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403HVFou021293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 17:31:15 GMT
Received: from [10.110.76.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 09:31:14 -0800
Message-ID: <736aedfd-7db0-4a0a-8d3a-a1328e70ed18@quicinc.com>
Date: Wed, 3 Jan 2024 09:31:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] wifi: ath12k: Refactor mac callback of start
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
 <20240103063731.3356060-5-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240103063731.3356060-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uzzHjvjn_vixos55JV7Zbci8jSxNsMq_
X-Proofpoint-ORIG-GUID: uzzHjvjn_vixos55JV7Zbci8jSxNsMq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxlogscore=344 adultscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_093116_837841_3F6BBD77 
X-CRM114-Status: UNSURE (   6.08  )
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

On 1/2/2024 10:37 PM, Karthikeyan Periyasamy wrote:
> To support single wiphy abstraction, introduce link/radio specific helper
> function in the mac80211 callback start(). This way, the callback can be
> extended to handle multiple link/radio in the future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




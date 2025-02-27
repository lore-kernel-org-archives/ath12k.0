Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D75C19F2E
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 05:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Gl6vEk1HZ/abrV2HnFPrSMQi+hXtWln8uy/4lCmXXI=; b=co+2/4EULJr/HipE9gq8OK+K3h
	f3n11fP5uTSF8I5OpeMI1tozsF35dcDtQ/6VZp1u/WgEn2xti4OKDO0PFDS63Zwgd+hv5hOUbRk19
	iXDbuk0oQhAIXHV+hS7OneiXoRFCQiWPR1nQtlHlEHP6DLvFTLpuBZZxcRKrOzZdOoZtR3gR/mfAf
	2roJSUFVU5TihyLclMmw/sYRcZjN/A1alRh5YwaLzlTAMEe+CkcMtFvaHjfTJIPfBBcIzTD92YbtJ
	/8OgNCTxiksWJeIeYO79iAX+c7g5w9bty94d6lg+vMP9kHb9aVUEcPZgHxYdFjp1NjUibL2GSDD5a
	u7S9YQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWkr-00000006PAN-2xAo
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 05:48:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWkp-00000006P9J-01Qk;
	Thu, 27 Feb 2025 05:48:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R1wXKA001046;
	Thu, 27 Feb 2025 05:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Gl6vEk1HZ/abrV2HnFPrSMQi+hXtWln8uy/4lCmXXI=; b=gOMxxTCbOVh+xGrV
	EDt6T5meQyr1IBRo/GM+N9F4OIW90oNu2jA3zKRQld1hpU6md6qiJOKlMrjYbqz5
	DliS2+6D4ZA2db/uqUv3raoiVEK5Y81Rn+y9FQjSkusmbQsMe7ilRWT6VB+dJ2EE
	xoHgmlEo+9mbWG/YHe0nvFhYdRiesvHDyNnthZudAlDSgeoK69ZqXg6aSeBG06eB
	I+pZ5rCcCN8fbjpQkQtKFDYUC+p0GlHKnytEVvFbjHkWgINCmewzB9o9jWoXmQCx
	93LAdrQG+2N9xEoPCurGdcMIsUdZ74jjJAMJl6BeqerEPLTNBVrPjqUOCdC120nM
	R8oOgg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4523kcach2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 05:48:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R5mDSd011781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 05:48:13 GMT
Received: from [10.216.32.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 21:48:12 -0800
Message-ID: <8ac80911-a356-6a51-15ab-3b5500b30862@quicinc.com>
Date: Thu, 27 Feb 2025 11:18:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/5] wifi: ath12k: pass BSSID index as input for EMA
Content-Language: en-US
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
 <20250210182718.408891-6-aloka.dixit@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250210182718.408891-6-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JexNvuvpOD0AFX1xkWJRbiTJECp5wXXt
X-Proofpoint-ORIG-GUID: JexNvuvpOD0AFX1xkWJRbiTJECp5wXXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=722
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_214815_050094_A7784C49 
X-CRM114-Status: UNSURE (   5.13  )
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



On 2/10/2025 11:57 PM, Aloka Dixit wrote:
> Function ath12k_mac_setup_bcn_tmpl_ema() retrieves 'bss_conf'
> only to get BSSID index which is an overhead because the
> caller ath12k_mac_setup_bcn_tmpl() has already stored this
> locally. Pass the index as an input instead.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


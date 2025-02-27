Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F88C021BE
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 05:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxHZmZwE8FNxnVT0N/qHBlvWyUcOpmThT3ugqYjnV1c=; b=mnXyRqsk2Ty4/MmKOvWkO/B8c7
	9Vq566rIYrsBnNFK0hpHlmYfcCZLWdoHeTMenm23Gfh48V3+XrWWNVL59FI5XgZEUq1fIoobWHB9j
	nOi1prkpwbWH8ux0byioIOKbKyGrVaWL3mQ5/xqqE47Vpw32rO+JQBMGndulsBe1xIDcxdv+rlgH5
	s388qDFPcLwJdifibi1JGp9nnFbkkcNaXqp/cHzypcKRGK6w6L6VD4u0DVx/Q9I7w7EkgPXUwNpR8
	s/vRgMgqC9pB12PVdPsBUaJEtU/0FLcEiUHOQWN3EKU2WMRFExFyuNDLUnww8A+VJvGN9LNK32Ra/
	A3VL80Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWjJ-00000006OmL-08Be
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 05:46:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWhY-00000006OUt-31Ue;
	Thu, 27 Feb 2025 05:44:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGHccS022780;
	Thu, 27 Feb 2025 05:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxHZmZwE8FNxnVT0N/qHBlvWyUcOpmThT3ugqYjnV1c=; b=cPH842TKqQAF48df
	dNAiLtOGHJKgnJhuyG6DMfyuzodGEW6ot208/XIPgzVoBwpazOdjgMYaVb3nXJRU
	b0glebtEXUYKHktwQFS3xzzyht/sFP+3B8aXAjcxPRhPfP9CcZVIhvuC2pxxFTkZ
	V41qT9UgNsyfy3O8FGeum2y7TUOpamWRpbsrj6f11rNRqD0VLKhpGPBVfCQb6kps
	/teIFlrHdilT3GnJgEhMfBs8HZpPgrxo13+awSNRWcCiKJHzREZjWmjI6lZ37V3Z
	hb9EkDLEPqz79Epc5CktIMlHxFP3G+r61v/gS82P2pkJrHrey4MAybss1TzJ2v60
	zhv6Hg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4526bj1tue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 05:44:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R5ipce021312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 05:44:51 GMT
Received: from [10.216.32.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 21:44:49 -0800
Message-ID: <ea6c7671-ca35-492f-d314-9cee535147b6@quicinc.com>
Date: Thu, 27 Feb 2025 11:14:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
Content-Language: en-US
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
 <20250210182718.408891-3-aloka.dixit@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250210182718.408891-3-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uOMVJFno3uCnelAeQRwAm2A9X1K0-4Ru
X-Proofpoint-GUID: uOMVJFno3uCnelAeQRwAm2A9X1K0-4Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=362 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_214452_766145_9569F768 
X-CRM114-Status: UNSURE (   6.34  )
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
> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
> the same pointer. Instead store the pointer and pass it to the
> latter two functions. Compile tested only.
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


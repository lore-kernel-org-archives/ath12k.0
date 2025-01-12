Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905A3E77188
	for <ath12k@archiver.kernel.org>; Sun, 12 Jan 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxDFs57jp7DbEc7eo6MiHeVk4WSoOvzdFORJxgnxc6k=; b=0LWxidSpjvhPlTh/Q/Hga4Eb/h
	pxeIRSifv7JXe1DzDCMfE+tAVRC2Qy7J1SrrKZ6M1GGSV9qxB7IcUEmAz3UPjHu1eYHEOgp6XZH68
	SytWer5Int2rg0CwdjIVf09YGXclGVnv9P+gflWtEsDq1j2tRvRRojMolwBFK4Vq6RQriut1B/eBm
	6Of3UR8iND+n2UOwE+kSzc71u6BE/xl318kYK3EuF77jkAlKFwcVJUdV1rIHpVitTJl2y9YqnA8y1
	KJWsPv6vHrx4IcbK8SXIl79PiLUH/YIWXwtbFrg/iYRGZ+O29uYjz6g+81HE/2ef4f4Bnf4MIniFW
	oYVwCATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWqvH-000000028z9-12Qc
	for ath12k@archiver.kernel.org;
	Sun, 12 Jan 2025 05:54:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWqvE-000000028yh-2toO
	for ath12k@lists.infradead.org;
	Sun, 12 Jan 2025 05:54:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50C5l7hw023794;
	Sun, 12 Jan 2025 05:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dxDFs57jp7DbEc7eo6MiHeVk4WSoOvzdFORJxgnxc6k=; b=oKt+xjAFIvXEMvA5
	1TSBKHju/CngbqvWxGpIs6ffkeq+Yry3v3Q0uZF7fDrmH7QQRUQ/H+VnQSXeVVBW
	svmlv3xHErq+jHYp7e6s4P/AwWM9Wlyiurpd2ptDMXa8tBsHFeUjKjoKFyzyQ3sf
	AbncV2jptHYpkwKt8uWryGCgHI6F6mPxqLA+qfa1zbhGgZit+n4qXvaMToQh/7sG
	IGCbL9qOx5+aSCw1856c5KFayijw8DOXEqCUjne+CMW67eAL52eemYGhE6GRc6rT
	ejI+gHJtnmtdcRQgryHca185AMKvRw3STJUjJkBFyfLRzTY4eO/siNPSADWF0knl
	ellWww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hj2skuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 05:54:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50C5s2EK003270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jan 2025 05:54:02 GMT
Received: from [10.216.41.154] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 11 Jan
 2025 21:53:59 -0800
Message-ID: <b9021f1a-3ea1-4e31-9f44-5b031878e0ff@quicinc.com>
Date: Sun, 12 Jan 2025 11:23:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix key cache handling
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250112-fix_key_cache_handling-v1-1-aa952cd3c368@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250112-fix_key_cache_handling-v1-1-aa952cd3c368@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9q46CH9ko1NEP0k4pnbcfzQFY7CEPW3T
X-Proofpoint-ORIG-GUID: 9q46CH9ko1NEP0k4pnbcfzQFY7CEPW3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501120049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_215404_761228_910ECF61 
X-CRM114-Status: GOOD (  15.30  )
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

On 1/12/25 11:19, Aditya Kumar Singh wrote:
> Currently, an interface is created in the driver during channel assignment.
> If mac80211 attempts to set a key for an interface before this assignment,
> the driver caches the key. Once the interface is created, the driver
> installs the cached key to the hardware. This sequence is exemplified in
> mesh mode operation where the group key is set before channel assignment.
> 
> However, in ath12k_mac_update_key_cache(), after caching the key, due to
> incorrect logic, it is deleted from the cache during the subsequent loop
> iteration. As a result, after the interface is created, the driver does not
> find any cached key, and the key is not installed to the hardware which is
> wrong. This leads to issue in mesh, where broadcast traffic is not
> encrypted over the air.
> 
> Fix this issue by adjusting the logic of ath12k_mac_update_key_cache()
> properly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 25e18b9d6b4b ("wifi: ath12k: modify ath12k_mac_op_set_key() for MLO")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> ---

Pls ignore this. 2025 Copyright is missing. I will add and send v2. 
Sorry for the noise.

-- 
Aditya


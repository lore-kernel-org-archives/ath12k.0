Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0AEC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WQWjgLwC19tGZ93ePrqHzzU+0y65Y9wnRofKDOzaes=; b=DoGhLsw/1pYPjG9n7SPifXe/pr
	nDL+7q6fcebV/zQ3RXMUXIctbkT/V5RSthLq6lYJ+VvRhKPlAg6PrOjW2vb/HOBLiSf9UP/smys7B
	ThiaobPH9/cnW8v5/xpgRgpBic+h4FC/qtWjKTFmOdeFGnDIVvfIq3FoH+GqraTcM3m5F2ou3ku9y
	vSm8eME6c4BeLg3sCEB2XPC9mnX5SzgkzAsfj0Kk0ht2kR4pdJ6eUIthqss+psFMFwlAml1kz0A6i
	BE2Ps4AIvBsNxWhwKF/kqQk0XDK+2s4sq6g3nYqCyolxpCoh+grQQdHYO/rjkU/KITrVz8MooZLG1
	Z0DLw8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQCEk-000c39-0c
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 20:10:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQCEg-000c2L-2T
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 20:10:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40HImDHL003914;
	Wed, 17 Jan 2024 20:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=3WQWjgLwC19tGZ93ePrqHzzU+0y65Y9wnRofKDOzaes=; b=c9
	CoEkNJ7t73GINp4CtXj/kg5ruR6oaH5B0OHF2molB4WFTulE7tXSD6BkVPs88cpz
	qCTGKOCXFSmMS53ANt6E8XfUt9Bl5tnTDuU2fQExxaGDCHGbxQlx9Yhm4SXWfvaI
	Vs5bxmNYSKRN9KIL1ovtVn5Tv0/8yx6j0aEF5gsvEEMQSyabt9vEZmOZuCEBrYGv
	MoWvYorb8sRmWTg3+3HgGvok5b6zQPGMKRI8iUMy6Kq8OyDUbXm9HIhqOjyGxIz8
	467dMGGxz7C58gnHhfyH0EzDWihbsE3UNwnBIf4JI3AtZRnMDtCaIF/nQEYo/HBM
	+EARSk7w9SF392xt1IWg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vp6p3t3aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 20:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40HKA2go008786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 20:10:02 GMT
Received: from [10.110.99.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 12:10:01 -0800
Message-ID: <1af2d944-0711-4fc7-bfcd-a34ebd0b7ef7@quicinc.com>
Date: Wed, 17 Jan 2024 12:10:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] wifi: ath12k: Introduce the container for mac80211
 hw
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240117161451.3385227-1-quic_periyasa@quicinc.com>
 <20240117161451.3385227-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240117161451.3385227-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eNXkzCBtZvbgnWkevxZQe-fuLbbDZCKB
X-Proofpoint-ORIG-GUID: eNXkzCBtZvbgnWkevxZQe-fuLbbDZCKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=703 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401170147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_121006_971127_5C18992A 
X-CRM114-Status: UNSURE (   5.90  )
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

On 1/17/2024 8:14 AM, Karthikeyan Periyasamy wrote:
[snip]
> -static int ath12k_mac_hw_allocate(struct ath12k_base *ab)
> +struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_base *ab,

this needs to stay static, currently fails ath12k-check:

drivers/net/wireless/ath/ath12k/mac.c:7897:19: error: no previous
prototype for 'ath12k_mac_hw_allocate' [-Werror=missing-prototypes]
make[7]: *** [drivers/net/wireless/ath/ath12k/mac.o] Error 1



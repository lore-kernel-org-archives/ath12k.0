Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787A2C02185
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 04:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shVCco68hn0SDof0iYCSnYELsOPUP4GCu21j34akdmw=; b=grFjcvGmC/h9xESgiCCMRCoVSG
	H/fTgsgpjcaqEQ5p/TgwFvhrsJSi7xk4Lpz3u5uK4KzsBbNX1SConREDo6mkk/JVWLeMmf113QROU
	N3sc7dhoFPIMhJgjoHRjfe5SAMzs2n9VxP435qK0nJ9HzxUP8IpCp0Nja9ZeQzYVWBHNvZg8caLsv
	/QlLDvqgv4nnSJx/rBXVDUHI4F6BN1C/vIC1vMqp2JBnY24gySL54MRTXt3r7zDKOIR6mzOeJG+MO
	gEh0SzpUhLNeQYJfbr5CsQ4oBLSlyIl1ecCmyLzXnj+JzPeFJ5LVemDJyg5pc50kcgfVlH28xmzWi
	TD5QUyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjZb-00000004iST-0TwM
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 04:39:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjZY-00000004iRX-3HRP
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 04:39:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JNHoUl005268
	for <ath12k@lists.infradead.org>; Mon, 20 Jan 2025 04:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shVCco68hn0SDof0iYCSnYELsOPUP4GCu21j34akdmw=; b=enzIINtiutkXZ68T
	I/sGNcNr5/xAInqOlJve9bKzOXDSj04CAVhxFm5PcQ1zzZV5G+uzh3qzBOjI5QdB
	5ltNlSTO2oHlHmo3A6ZE2dBC54dfMNK8186MrfAaD53gnqpmvOVjgLwmQkb0dFlL
	5sQLuR9IZcBhm5H0rI8kbM1HFrpYhaoNak/OAiI2HHf73yc/9gp0vM4XpJz4FKa8
	k3K1YaIK+lTn2Va/ElqM23+b/aIEfMdGp/Q0ajmmpiiMc4D3CnLkLqkaUgt76kVe
	WE63Rfyn0uzG6WnNbFk1dmq+yT0j0uuA59rD4fNCpaJ/WAiIXJs9mDsMrkqBtwf2
	QqEujg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448wjk1a6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jan 2025 04:39:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K4dZ7u014235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jan 2025 04:39:35 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 20:39:34 -0800
Message-ID: <acfa729a-bf3c-4359-966f-1ff11002b949@quicinc.com>
Date: Mon, 20 Jan 2025 10:09:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: <ath12k@lists.infradead.org>
References: <a4bdebd14f5dbec653b75277097917910344f244.1737142154.git.repk@triplefau.lt>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <a4bdebd14f5dbec653b75277097917910344f244.1737142154.git.repk@triplefau.lt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PEoI1JYQgHkaGd6EDTRDa6hkjd-W6KAn
X-Proofpoint-GUID: PEoI1JYQgHkaGd6EDTRDa6hkjd-W6KAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=755 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_203936_829122_C72C29AC 
X-CRM114-Status: GOOD (  14.98  )
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

On 1/18/25 01:00, Remi Pommarel wrote:
> Currently in ath12k_mac_op_sta_statistics() there is the following
> logic:
> 
>      if (!arsta->txrate.legacy && !arsta->txrate.nss)
>          return;
> 
> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> if it return for empty legacy and nss of arsta->txrate, then the other
> stats after it will not be set.
> 
> To address this issue remove the return and instead invert the logic to set
> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
> 
> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
> mac_op_sta_statistics").
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

nit: An empty line after Tested-on tag since that's not an official tag. 
It is ath specific tag. But I guess Jeff can fix this in pending?

> Signed-off-by: Remi Pommarel<repk@triplefau.lt>
> ---

Anyways, patch LGTM so

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Lastly, one more nit - please include base commit in future submissions :)

-- 
Aditya


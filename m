Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9ACC6FA8F
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 05:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+EIlvgiuNucftPGcTd1S9gwSeMdnn6ceURYEVnc8FI=; b=1GrFfKkMkks8o4
	VB6ltrSpMg9xRDAzFrldkjFKGLO2hx78kocPBzi6fqj6tf2+KJwc6/RlJ5606R6d6l136DVupK4Xn
	4IZSsLM3HYEXj2f/+cmGc1OTxNNTb4YbQeRS3HCJ/rZAiOmqDrMDXKQi+5nQAv05sakC2VHXJ5P4o
	QyA+FYGCdhsrcL4vAa8txjgyAjb17xub30wUmf6WgKHtKLoTjfBavy+KJjT5b7kqZOEEZcd5kW3lm
	tRghF0/23yItuFHb4fACS9UJaPQ+QbIrxV8XjwMB63OTbaprTeIinO2NSTjCGH1Suhj1qr9aOJPjl
	ZKub2zl8ZIGTlAbkWEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbDxt-00Crbr-0S
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 05:42:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbDxl-00CrWn-1Q
	for ath12k@lists.infradead.org;
	Wed, 30 Aug 2023 05:42:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U4U0Y5005151;
	Wed, 30 Aug 2023 05:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fXB+I5cpp1GRCVEYZ9qHgnkX45uwzaaNxWlfwgzVaAU=;
 b=h01hbVR0nQ/dd0FLkUG2Bq9CpIiFuzRz9XV18ZzHuxY6Lf92UF1CuwvWbeZBYwhnCEOK
 g1ooF54cdlhD0MD+YXy3qEcUEI5cHoN6UY7xCMEOsA2GjO5OxVdJ4yfunhe4khD+CpKg
 G6OAHRTb2KDFPcowoMQf3NhpyB+Di7HH+kulkRQIvBTNnKq6QndA/7lxXvEshKiFy+2h
 FZ7BpTXjD835PRXW0NA/tCOETIp/DmnnNnXBxsoMohI+tNsmL81i/hRVQfRDJ/RqAVqu
 N8xXh3B+TjC6yulYbAdEh1gZYgFctryB49mVwtDQnhyDkcvJGHKtcDYnfN+RAtoIEOVw Mw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssv008d15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 05:39:52 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U5Yf18021152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 05:34:41 GMT
Received: from [10.111.178.80] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 22:34:38 -0700
Message-ID: <477607e8-5d56-437c-9c77-c1a46feb01ee@quicinc.com>
Date: Tue, 29 Aug 2023 22:34:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix possible out-of-bound write in
 ath12k_wmi_ext_hal_reg_caps()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230830020716.5420-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230830020716.5420-1-quic_bqiang@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Be1eQmgvm3muuX7ybsbK267uk-rNEzJ4
X-Proofpoint-GUID: Be1eQmgvm3muuX7ybsbK267uk-rNEzJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxlogscore=822 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_224157_511313_F7A3C423 
X-CRM114-Status: GOOD (  18.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/29/2023 7:07 PM, Baochen Qiang wrote:
> reg_cap.phy_id is extracted from WMI event and could be an unexpected value
> in case some errors happen. As a result out-of-bound write may occur to
> soc->hal_reg_cap. Fix it by validating reg_cap.phy_id before using it.
> 
> This is found during code review.
> 
> Compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index ef0f3cf35cfd..a8a7fa9f71cf 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -3876,6 +3876,10 @@ static int ath12k_wmi_ext_hal_reg_caps(struct ath12k_base *soc,
>   			ath12k_warn(soc, "failed to extract reg cap %d\n", i);
>   			return ret;
>   		}
> +		if (reg_cap.phy_id >= MAX_RADIOS) {
> +			ath12k_warn(soc, "unexpected phy id %u\n", reg_cap.phy_id);
> +			return -EINVAL;
> +		}
>   		soc->hal_reg_cap[reg_cap.phy_id] = reg_cap;
>   	}
>   	return 0;
> 
> base-commit: a62b0aeb556839fb6abb9835874443b08fe95598


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

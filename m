Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD049C47DD9
	for <ath12k@archiver.kernel.org>; Mon, 22 Jan 2024 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHiVdvVHqT12Ix7/o54Eufibla46GocvCvN5VVrxm+Q=; b=eqoz9sBmylYKFROfpd7XBqnI1L
	oCgrqQ2ud8Y6AlJ2XAcjFTof9LOjNbDhJXp31ZueAPEpbaxNXtwBgEsfrBzjDR9FlTCz4lgXGjFix
	3Pq2KjPibi0FX4yL0JIRBEJd4NgoWzWCoVHRyneaIMTOMiJtq51EYUC8F+18F5KtegDrtcLJHCzHx
	5+iw1l3UzYEM2AKKUbWqP/X4XVZBFzmsnscn2RpnuPm+QPfpp97ujCUn1xseBEODtRTGgvVJ+yX0M
	fY2yfIg4gw+1D4cKNTBviKP+meYlPS+dnOr3Yl1LgZAqDMp+U4T+M6oh8JO2sfR53H8vHt9r8xoCP
	YW2DZrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyOl-00DLLl-0l
	for ath12k@archiver.kernel.org;
	Mon, 22 Jan 2024 17:47:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyOg-00DLJD-2G
	for ath12k@lists.infradead.org;
	Mon, 22 Jan 2024 17:47:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MDPvam016608;
	Mon, 22 Jan 2024 17:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nHiVdvVHqT12Ix7/o54Eufibla46GocvCvN5VVrxm+Q=; b=hM
	hwfQjvtyQaPXjK9kKx/raAwUYkIDaiodLZj7zWHGvACiRvPKN8clEXkth9xl5Z07
	n19FVdLNluqE/zTEaBA3KMpERTMZEqAaCB3xT6C0a1qTMFZ2M6fkl/SS3U2oJHAy
	7YI+6jURbKyS4Bu/vli/9Yi2L1yu7QvSQrC6hUr7QIPJ6pnw6ap6NH7GaTEN+Pqw
	1T3jCHL2C2dl9j/2i3/eNpinacsrUx+jLipRtqBGzEWUY9HmQ/VvIoVSY8B66JFd
	T61TZqK6/7fl2VmxMe3LqdEIq5+qxJcxBshe2w8SaU6Mv7Ji4t1EX+nialbl/wIp
	gK1rOjEmPJ8siYLX5faQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vsjkthra4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:47:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MHlfwH025320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:47:41 GMT
Received: from [10.110.26.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 09:47:41 -0800
Message-ID: <ea2952a4-8343-407e-9a9c-3c93f4afd607@quicinc.com>
Date: Mon, 22 Jan 2024 09:47:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: add processing for TWT enable event
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240122085336.3985-1-quic_lingbok@quicinc.com>
 <20240122085336.3985-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240122085336.3985-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mIk_ro77vV-eSaHwdlp1LdSNIf7-_4-I
X-Proofpoint-ORIG-GUID: mIk_ro77vV-eSaHwdlp1LdSNIf7-_4-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_07,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 mlxlogscore=856 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_094746_875694_EA9150F4 
X-CRM114-Status: GOOD (  10.83  )
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

On 1/22/2024 12:53 AM, Lingbo Kong wrote:
> When ath12k send TWT enable command to firmware, firmware will return a TWT
> enable event to ath12k. Through the analysis of TWT enable event status, we
> can easily obtain the status of TWT enable command. It can be more
> convenient to debug TWT.
> 
> This patch works with WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
[...snip...]
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 06e5b9b4049b..7570ef7be38d 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h

Qualcomm Innovation Center copyright missing 2024

Kalle can probably address this in "pending"

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



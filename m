Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D041DC3ABBF
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWDAuqxY3hVY3E91SimJ0g+97uFO5MxUMA4Q1Xjwb4g=; b=weKZ1kxTFQnHgDanZKNpfgat4y
	2LG7NA0KZL+PpoLGfqelRCmeX9T6l0fkfxpUnn4zajz0+AZ/3L6KwQOzF/31w1Cvwhaokh6X87Fs9
	ymTGub3QmYPEIMSudcoqHKXvgYeFHt9VDk3T2yFMO/hlqEeZWcHdFvig3jTiDj4K7rqfDh5OktAGf
	bNhulefc38IAK3DR+xcg31bOIWA7jM7f6fRja06YSggAymqGrkfGaV0LgI8pnmvpq0KFFSmFUNYIB
	pYSdWXqvZwfZ6ZjgRovDuWPRWjnPBUGyaJgPGeL2y06WAeWskwXOh31OOWnAGdRrWNgyjyjFz1D3y
	rpOpML0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbOQ-0000000F0mK-2MdR;
	Wed, 07 May 2025 09:48:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCarR-0000000Et6v-35wr;
	Wed, 07 May 2025 09:14:43 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GsQd019058;
	Wed, 7 May 2025 09:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWDAuqxY3hVY3E91SimJ0g+97uFO5MxUMA4Q1Xjwb4g=; b=UjGYEWdzlI6uLIrq
	6mzcwkh0+3tLb/88Y87wK27JamAXLJm/S6HiTvk3jpBuh7JcjWHcnldjvCTsFo4l
	OJTGRwt/UUtegygLOLSMxmxxMiIKaUeM4BgPiRQkmn2K6eUzfCs/eBEmOCfF2gZT
	ahhPfCDd09YNVcP0ng6Ygmj1yp3sUzgFlXq6vPqMdVc/HPiVA7HkZ8LMIEMgZYka
	yw4imIdUIEkpPfAklnvSFiU+IcA719SXndRTMxn7BNBQGXHA+0nqoWx1MZ6oVSxc
	5FLVcZWuAEqumkkW0vYlQkawSTXQMjQDlEw1M/fr3gBbhCHzhaGyZwwqz8JIT5FO
	yAnAFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5wg522r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 09:14:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5479EN80003651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 09:14:23 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 02:14:17 -0700
Message-ID: <d3725aa4-ed50-447a-b396-6d3a79bdef99@quicinc.com>
Date: Wed, 7 May 2025 17:14:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Jeff
 Hugo" <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir
	<quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Yan
 Zhen <yanzhen@vivo.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan
	<chentao@kylinos.cn>,
        "Troy Hanson" <quic_thanson@quicinc.com>,
        "Dr. David
 Alan Gilbert" <linux@treblig.org>
CC: <kernel@collabora.com>, <sebastian.reichel@collabora.com>,
        Carl Vanderlip
	<quic_carlv@quicinc.com>,
        Alex Elder <elder@kernel.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: p_jG0Sbno2oZ98DpC9OAqDCV3vFL_SqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA4NSBTYWx0ZWRfX28FjdaIizGlH
 OjmKXluBVlr8MqtezBOfynzjclypPoCtQTToE0P1h+VtGLUN/dSruNDkLTFaijeC4tYD2WFk9n8
 ToHMVAp17i2+Jvw8TaFTmqwU9/4UrtjRUtYGw6ieOh7oNLKtWhjwZ1m4suYYK3ydPk1mnUUvYWp
 i3zikAl208PxjSII13dZ+xjniCzEFZF3TRYoaYBerar1hU3ZGlJd8ze8wzBV7ODy69UN2a+kF7v
 V1eKqKEg4CWH/7K6BOVKtj2sfLcMDfqWatCZRje6hRgCMTDac6TjS3V2kKtgcX/JzWZe8Pt3kV3
 c2MFuqQOIlGjSJuyGaD451xtgqsWyZnB5dn2tyCdN0TNjijafgDvzGywcFcnopkOqVgHxjsCaNw
 FYeLLoO1sr/hZyzAFCeEUZuzavA9Zgm4C1c8WZ4VrxVMoH2odAui+AY4VQ4wxzNHcvRD76ne
X-Authority-Analysis: v=2.4 cv=dPemmPZb c=1 sm=1 tr=0 ts=681b2471 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8
 a=COk6AnOGAAAA:8 a=mPD-axTYSJuEfRLCb94A:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: p_jG0Sbno2oZ98DpC9OAqDCV3vFL_SqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 mlxlogscore=913 priorityscore=1501 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_021441_925778_2C1E7A57 
X-CRM114-Status: GOOD (  11.77  )
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



On 5/6/2025 10:49 PM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

with WLAN firmware unchanged, suspend/resume is working well:

Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>




Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9797FCD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 05:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZA00uVe/S8IEAGfT8Zrn1us5JHS7tBDa90zZUoeImA=; b=Z/FztNUIDwktyoxvObLG/v7Yep
	RA/LF4IAUklyVhQpukhe9lDFf5SsJCz/I2yFuFgpjYymdsflwEYLzCWfLhcGjz62tHqm4lZ97Q5ag
	Q18nlMNYW5E4ubI+OIMimQ/ojDKiubhl5BA963OhftP9GT648Z1FHfh8GoxO90CoTtTX/BalWgvzd
	miivg/fSM3boNwbiHYEGlA1uqRB0a6FmbJnxQuCp9lOVkN6eUV1FdDgt7s1QW4HyAGpilD1iUP9Og
	9+N0h4wj2mkWGNqvKrEuvSJ6b6NzQ3r1WsMVGxODEpo9i0H96YVqgUMvfBPEzeuAD2+jgNDe1lZAc
	hxU+c7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvd8-0000000AAb7-0nxe;
	Mon, 01 Jun 2026 05:56:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvd6-0000000AAah-23TT
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 05:56:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VKUAho2006130
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 05:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZA00uVe/S8IEAGfT8Zrn1us5JHS7tBDa90zZUoeImA=; b=gynzt6IZgF8dugQ8
	JuqKD14hwshsAMfaP0X8wDouESdTH85QGHN9jSeCWTofQmZYLx0n04SLmQ3iWcKw
	rFAYTX0mQ+hBL8BBZSEMz52a5uGpwSx5GuG/K+5OVdgUulcodFmE0NC8ucWluKPB
	UVrYRY5N1oiLUY7K1xrhRkFB9oehw58URQw3BH+fFxVXFpzaPLXtf47YxQvj0mZB
	JPZVeXtDVYKOzwc2fkxFO0rxyObyZMss8Jev6sSzbCUByx63YDh2oSEo5uCdM1nM
	pa9Lvf6p18WBfp1f9d+OjJWMIUOj6WwbUH8u84k3ACoveK8G9J0iSHVZVYqs4JYc
	55VyRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqfxwywe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:56:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36b9d265308so2809070a91.2
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780293362; x=1780898162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZA00uVe/S8IEAGfT8Zrn1us5JHS7tBDa90zZUoeImA=;
        b=CIzc5dENLGG8UP9GSz6WcHWBXaFEohA/10EGQmX50SHIQ4fqi/KOG62Y+FnsukwVRJ
         p2nwJJ8XmeD3O8475oMi6D26GuTDfQG4V0FtHX8z9VgjzdSgEmFNkkb60kOD7cZucwtJ
         rRVdrhvN8hiBJaUv5S8aRjnshk1Vz13D/ENwV58X70wSkGL9ijTnxIpvtARa84QCkmtc
         zKQsjixCPIJQz+5ChYwEEc8kg3YpmNSJQvc6QzTDil0JjtuCAUTE13xlQi8A6hmInwKs
         VsrsUpanrMmYQK/YX+biwHWhehTQAp/phmmcD8mdXJFC8mjb0+DfNLwfXaA++NCzK+Gg
         9LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780293362; x=1780898162;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZA00uVe/S8IEAGfT8Zrn1us5JHS7tBDa90zZUoeImA=;
        b=tDRoFGP5AZEBoTUtav0LkouWgXD0BB6wirq3FTqXSoAgPey/W2v4SLxcrZxCMxMoyF
         /BHiyrTaAj0QB4nVBzUCHr+RXisyNDibQBaHWnzTuRlRrbJbJPVJP8XtFQDXDABH030i
         gmlxtjqpKldyG7HFHe9f9u3WF/emQAIsBTwKgVYahqA7v2U/TyFdycgsdXwph4F0mJR8
         jsJeX5CvnUKDq6DEN0j+VU3slXLCq8R7/SWG8w+dc72VC3NEVDu+tQ1ZAnEXylIW3v/B
         dZ3y0BvZuZzTBQQrjLzPbIj2roI/wKw/hC1FCBIDO6McJpshcKI3wWmSU/U6xso4co65
         ANuw==
X-Forwarded-Encrypted: i=1; AFNElJ+yPZwiFaq/XeeXz3B+R6sAl3qfPiQhXnbVl2S4zR1iQVakdXwO3HOBhYshgV6AOeCoC+1nplk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsdebLzcWs/0i8+eGpgCzu0FLXWY8mwV5c9YCy841UxLpd+i+n
	4TmWJOy83xx0yVCOBORjbr8XNbILa2gOhH2ykEWHfAKMFxcDa6BEbikJJwiW8L3wojIhcdnKxpZ
	c7cHwpeBue3thK9I4rE9ajNAH9EAtpg+O0qFDFd+QFzaDo3C4A+D+hRHhDTCz+er3
X-Gm-Gg: Acq92OF9hyQ29PdfwmvVF7ocnLuUSFK/N6f6j2P4TWXmCGJ0rGHpBXXZWgVAMQbChnl
	i6QI++f2/vThPv+MkGxEwhCpU3BDXLnwYCyrjWOhSKOA6Q0VuK5OXU7zSmBV7PIqEJtcxGZBLd1
	Ze571diKqWis7F+RNhdasahSGPfEwNA5sWgfhX3xeF5m9e3Ba8Wo6wpR3DuXHeOEQf8IsyFtayj
	BgHOP3s+IKkONewZ4UDKS9cFDfGvO3MJpBO+m9JYTth8tCpiVmTEzpuniHmOjhNZDqWXPHjGX1T
	5q2o4b4bYcWS6ou0uNCb/f7/MhMoM2zBw+q9v9HkVqAxabJg4/oT1Y4ciSoIKq5M6UJB89MwugK
	QI5RuIjOn5VnFJJCnfrmKpeQaBCA/zlIFUo/4F2tRXJx7o6mi2N5SUhDaTQL81nFbCxo04bkHr9
	t4Hnp0GKmYgvpzXMSBct4MFsIh8yj/
X-Received: by 2002:a17:90b:580b:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-36d66d436cfmr8685601a91.5.1780293362194;
        Sun, 31 May 2026 22:56:02 -0700 (PDT)
X-Received: by 2002:a17:90b:580b:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-36d66d436cfmr8685586a91.5.1780293361676;
        Sun, 31 May 2026 22:56:01 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0bf8fc0sm9677443a91.13.2026.05.31.22.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:56:01 -0700 (PDT)
Message-ID: <303ed0d9-d785-4775-a467-95427caf20cf@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:55:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: Add driver support for WDS
 mode
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tgCXW2CGjmA2SdOSGcWugqtEDdAuTgdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1NyBTYWx0ZWRfX0sZ8zCu1w/6b
 S3lPkj/RI2IEKxVrS9V1Z5wH0thTjotwmmjmSxGKbUHX5LFPeyAioMHvQw7fm5/dNw9Sj2xJKWA
 lBfxwbXTZtykQ31XCVI5v8SYv+/opqZhvF4uXHnU9a46N9NAEr6O5yDxl0oP5uTHu8Do3Kc+fzp
 Oi2gNbysnzaeQuhQU0J+JMzeyhdU7vxJNsSRmjB3/mUybAWeXjNw0J74flc3YXcttWxeeWzM5QY
 JfLGnsLBahdYH46xWiy6VIpZbt7IBXvUvjJVWO1fXPDaPMyHACLVLO43CCnbEGblHNN7jR4v0VI
 c5pacLSm3DIH7+3XNIUfaIrMRG8iMruav9vopC34sY9bmJE+BPC9Ca6pKxl5WbC/QWPddp1YbAG
 uALz6XaNOznz4PVXGR3mRJ5TaKvpvv09EKoPqP6izu32QqZn4y1qUd7Ql0ui5aPXWkyU/FwaHnH
 8PAwn14u/FhUsNcMfZA==
X-Proofpoint-GUID: tgCXW2CGjmA2SdOSGcWugqtEDdAuTgdS
X-Authority-Analysis: v=2.4 cv=Zq/d7d7G c=1 sm=1 tr=0 ts=6a1d1ef3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kn8-dOTC4ExnFVu9xQQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_225604_671510_FFBCDA62 
X-CRM114-Status: GOOD (  12.85  )
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



On 5/25/2026 7:09 PM, Tamizh Chelvam Raja wrote:
> This patch series introduces support for WDS in the driver by adding
> below changes
> 
> Handling of 4-address frame formats required for WDS operation.
> Proper setting of peer 4-address WMI param to ensure correct transmission
> and reception of multicast and unicast frames in WDS mode.
> Conversion of eth offload Rx frame to 802.11 frame for mac80211 to
> detect 4address frame and initiate AP_VLAN creation.
> 
> Tamizh Chelvam Raja (6):
>   wifi: ath12k: Set WDS vdev parameter for 4-address station interface
>   wifi: ath12k: Add support for 4-address mode
>   wifi: ath12k: Add 4-address mode support for eth offload
>   wifi: ath12k: Add support for 4-address NULL frame handling
>   wifi: ath12k: Add support for 4-address frame notification
>   wifi: ath12k: Handle 4-address EAPOL frames from WBM error path
> 
>  drivers/net/wireless/ath/ath12k/core.h        |   9 ++
>  drivers/net/wireless/ath/ath12k/dp_peer.h     |   2 +
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |   3 +-
>  drivers/net/wireless/ath/ath12k/hal.h         |   4 +-
>  drivers/net/wireless/ath/ath12k/mac.c         | 124 +++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h         |   3 +
>  drivers/net/wireless/ath/ath12k/peer.c        |  11 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  91 +++++++++++--
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  41 +++++-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   4 +-
>  .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  16 +++
>  .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  16 +++
>  .../net/wireless/ath/ath12k/wifi7/hal_tx.c    |   4 +-
>  .../net/wireless/ath/ath12k/wifi7/hal_tx.h    |   1 +
>  .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  16 +++
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  18 ++-
>  drivers/net/wireless/ath/ath12k/wmi.c         |  47 ++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h         |  17 +++
>  19 files changed, 409 insertions(+), 28 deletions(-)
> 
> 
> base-commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


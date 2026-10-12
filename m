Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A710CA9ED5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 05:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=; b=oO3H/cf8KM5Bcb6wn/z2btMZO7
	lzQq0RAYmb7XkSuWiLZmNYCqeRrHvH2ESSBuW7DPiqtTTKyMuSd1abxY1cI8YFXYFNgYl7katBDAW
	kqzV7G6JjR+IauAXprVR1Qbk7kFEpxG5B4/O6IQtXZHiSkoenbtvzz/g08v1b3kWpipcFmY5O80MC
	fz8EjgAHRgh3B5bXcxSeQrYhf2jiIe7UJqdTY92bqUfFqLQ7iG4yN4dE13zRijKJhWW+9+4UsJhjK
	yFXdfWCtgJfmuoiD6fXUXsnyEi0hOPPVlcah1IXjvzD2+8md/3Wa+8cqelKTgxpR1EuxS51dv2Xkj
	w/pSVmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8xO-00000009hMB-232o;
	Mon, 12 Oct 2026 05:52:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8xL-00000009hKz-2ZQ6
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 05:52:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y6H21216046
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=; b=mv7YeUWDwdmTClRa
	/9xojwGT4f2gOUhaSAPS69WH4dnR1EEFMnDekZ2UdOjwwNvv776TwH7linE/GaqT
	ytQIpPQcPa1yASxM7oiIORIGAlYGgf12lPExmOmDugeAzKX9FBSf/ied0SMntFmZ
	tRr/VeZpiENXZ2cR0rfKSK7OJ3MWUHXBR9u4L0l2tuNxtt1QFhWmtzsGfu6KU5aC
	qtmlc6Os2mi5mU8GpKndWLRGEUa7XODy26uVmQxy0lq4czJTQDOuj5s4q4Le0W42
	7Ap8too1RT35+aQbU9DqaOGP1uF3XNCLzTd3MvHE/QQ1A13WrDoEBR+QRDs3az+w
	j0CLBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0214-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 05:52:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1525543a91.2
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791784333; x=1792389133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=;
        b=QbgX42RF3D/4oAnGkLKFHQYeSg464rhAt7iJ3kROr+QxXmIavzzD9eT017qBqFBBV/
         Ugi72xgX4MKsiOuFrQJ3zi8wEe9qVI9lzsTkljgOVNevDPVeBWrejqD9/Cl604heg9g9
         3Ea/ypuBKhydDEOtSGt5Upuz9YTpk7/lOJzb7UGLjaf2ShEbMz96vWo7FyuwUuNfgMiS
         iR26nZ6Q5HkbdfcHw9Ii3wZy3q2Nx/GXvaaUzJKHgMzB/r/mnpNiC3eceuHOiJS5aRTg
         qq8xG2jSAEg2XQNQVCt8wLJsBMyPrv6dAQ2JKl7W2yE71X4mwZQwBU5M9GZG3EIxigX1
         DKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784333; x=1792389133;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=;
        b=0sAhfbJskiBsWX27zySuZrc7d/CPCb7BarCh6mzZbQyLhj3t8DcMydHkkncETE73RQ
         vG4NhletrK1t4LUd3VilDRiwWUTCt86XpFAHHYgsdek+SKWqE0SHkIlZ4qMvdxvJmvc3
         bdgstQFvgrszxOU2D7VQSg7nKuldSDak2v7yihpcHGTYMjyH4u2AlmZytxI/+UpXDOfA
         pEdsE75c7usbhMs054HEz295YtW+/aoCapq6zIW4tbDd5s7oLBz+NPh8PHjJcazJcsiR
         EjNLpC9XWI+KaP/PuLjz0aBqnCQYS3QFEuVyDNEBrexibWLCqPlyVUxXmDHuZUiRCusB
         5LKg==
X-Forwarded-Encrypted: i=1; AKwUvBwDJ4WuEuLG9L+BnqT3o5uofuvAxs/CWe5frLAPtqVTBcXgw4E+BbmPlfQaC1Met4zjcA8zSVs=@lists.infradead.org
X-Gm-Message-State: AFq9FYIchiQy2o0N0ouxyNgn1cmZrd9Hhmel4M/3VG+XMxOv7+fQKXrC
	/872O5WnHBQkTZX9z0HF3DQ+KgU+b2BabIhOKYZvoag/kb2wjbaqe6JMXzVg6QHa3OiMhuszhGd
	9ePQhcW02rTvetsdFIDQ3f658oQqg7Lr375JnKfoxmCS+LLH+EU3ErkV4GuAFnMXY
X-Gm-Gg: AYBFou2X6wDQTz1AUYFYWrxIK+5CqBQhnod2R4NoSgBOFh6JQx66HCb8vI1FBN+5c8+
	jspWrsGiRrpIghfBgWBibzqLuyChLVkG1TvIiGYLX62WreVXSHPPVmyUpQvoxWbGJ7PFZ+i98a9
	QnlC+ka4LHPMjgeYqpko2X8sb8jLUPY1oFz1b5SLinq3WnebEqfl3A/iWmxNmP2v0+Qmo4G3/DW
	XYvWTDyceHpoOX1kP2d70o68oQ7V2bnDsDXeOqCCztAz7kJsabu39Cti7qDjpBs7wMS6PgWPwm5
	cnEU/2nUW0KqNwXFkaSM7kN0/W1NhjgJxk+r6ow4G/us54R/y2c6BG43wRKzf43Za4mHC8EFZSf
	Yrq2L8Ri+T0naossGSWQfcr+8kKa0wmw=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5686400a91.6.1791784333417;
        Sun, 11 Oct 2026 22:52:13 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5686375a91.6.1791784332909;
        Sun, 11 Oct 2026 22:52:12 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e41126sm3869528a12.23.2026.10.11.22.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:52:12 -0700 (PDT)
Message-ID: <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:52:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc758e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX0IV4udl00Y3m
 89KxHITj+9bfECdSg8FdaIlxKBYIQXx53fzzD6gNPiRXdQbMRy8Bb/oSjENy/fWbnbSJHb1u3+4
 sz/0vFKMygYdvqrt5OyssVD2uoozkywurBx8I3i6P6RM53+1TuwmPcHM7okRqquN4avcEVTqh2j
 vgAwq4bMrAVACZHKGmQ+N67nNqUIAegMp2ZhVzwAVCCFRgv6ehaLgDLKHWOcaYLiTgsaD7TVkxY
 IbhQvqWWDNvF8USVw6XWxLOewWdfpOugXOCvYGREoBfvGAKt0egD/QNZd+iniIkm6NpvI1nO1mV
 zQMvkLxgMQ7ugTTQ9Pfv31/acULWhX7TElHjky2WN2cLt8tcwRjf6kaXHBaqTnAU7WUnOkeSn/V
 SFs/vp4nsbJWDMDdc9EtPAroR+VBY7KGOzEAl0lI0fE946JBhAGbzBuxdCf3ZUWHO6AsD78plzq
 r94X+ZNxRoYiAKrwlPA==
X-Proofpoint-ORIG-GUID: fx7eJqtV7tNLAWpFobn2a7d-AwXv0lGH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX9wKAK5QFYoXO
 vZOzZp9sT1yBXRrU4+B2fqEqFYCgHb1mobTpqdkNtnMuWLuZWARg8v98T5ZFKzfMjqm/Ozgqisx
 ppYJ31TS0DobS4BlAt8FwiKosANV6WE=
X-Proofpoint-GUID: fx7eJqtV7tNLAWpFobn2a7d-AwXv0lGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_225215_766559_2E87FFF6 
X-CRM114-Status: GOOD (  13.81  )
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



On 10/3/2026 5:20 PM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>   remove each IDR entry before freeing its skb, as pointed out by
>   Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>   leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>   wifi: ath10k: avoid IDR mutation during TX cleanup
>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>  7 files changed, 44 insertions(+), 39 deletions(-)
> 

if you want to go with current state, leaving the UAF risk in patches 2/5 and 3/5 in a
separate future fix:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



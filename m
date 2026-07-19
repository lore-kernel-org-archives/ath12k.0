Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDDEC4450A
	for <ath12k@archiver.kernel.org>; Sun, 19 Jul 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddkmmJJqxT+Dagg2XPzbAo7doThxXLzPRMVcmgsi+X8=; b=vUejvHVSSGtQGB7udt0FHSDteO
	xWH4OjwflovNVFLAVxhQ1U0wH04/TuWLmr3U6mlsvHwGD4GRKqo8vPB4ML/ZGCgFexEaJwIXUPslZ
	kOqF9nwYAVbXVESVTADrYWjFj++zm5rhRfZDpN0xAfCWCAKDCR98iGDiHL0KdGjZKhZvsZF+xkVDN
	j83WNXXHOn5XBYmZTwbnG4z+T4wo3Bk4DkCrvzAIyROvwPJBt+RYYTCG0dEbOFt3urKAMR+UTHzxs
	XpH1EwdIRAZcPmlNg3vh4g0aOCO4t3YTLDIxnvpe5nQLBCa55wyRQ1U8c+AYlKpluf63U+iCdx1Bv
	/pXc0Yzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlRvN-000000052nt-028P;
	Sun, 19 Jul 2026 13:51:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlRvJ-000000052nZ-2ICp
	for ath12k@lists.infradead.org;
	Sun, 19 Jul 2026 13:51:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JBAaoG3206252
	for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 13:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddkmmJJqxT+Dagg2XPzbAo7doThxXLzPRMVcmgsi+X8=; b=flNDb96BKvt27CaQ
	Fs4Ka3eLyfWZlwvDdgbKdS9X5DhPd70Vjg5Nf0cbu3ThJkHrv4NAWVH7dLmUj3qd
	hwiU56Q+L3rkklZj9Z0t7TJlrQC94sPfp05OR4zfxukqmseuTVZ4NlFSc2DH1kXf
	Em4cui8z/fy3W547B0+GyidxnNIcRcmzD9ylvZx7roh0BqWIGhhyul7LrObBuB55
	fADgLjpwviMo8eWfzTWVWS3I4i7P1NiYcJY3ZFL7k3lOi+xksxlpjaZb3022yZXL
	zxzh2+e4CXKFyeSRzA1UZOBLKHSft1H/AjC5ibUDOX8DHwcljTxaboqJLUobkrcm
	b/XoLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7tqxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 13:51:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so1707396a12.2
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784469075; x=1785073875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ddkmmJJqxT+Dagg2XPzbAo7doThxXLzPRMVcmgsi+X8=;
        b=SMAgYr8q/N+rsL7E4UJi93JwffCTpkrNIZyRKFSgRe/aV4WvtUXKD7LFGtw2ZLX29C
         Y0Mc6PGlsrC4C9coH9O1QwZbFhfKqbG1bidgLIb4u6TuWyubm4ve6LoYyNcLZREJWQST
         U5YpwQp4SQG5E7p0B94ZiIISpZ9m90oPsYodV6rNrCmeZicP/P2PH586G5G+56oYPRBx
         OxtaMnvDlq9RgK8TGIEne5BSM2FUaemHi7xJx47LjnImYw1y3wPt5nzeU4T9f3Fs32yd
         TRznHLG+PPfGf4+UKRG810alRAsYdmFYB38Hxotf+s7tqyKzJtTsUpcS77bZWNqueghW
         QAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469075; x=1785073875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddkmmJJqxT+Dagg2XPzbAo7doThxXLzPRMVcmgsi+X8=;
        b=s4quJKihsSrhM4K8lwj+O3Fj6UZWldULq+QaZQ9PrFk21TMahM859AZYN9mC0jHzlO
         dIqb94x4w0z0IEJaNUq5b5qcphx+jjL1dt2Y++v4zB5ZyLhasuFkvgM0B6KPJFn6VLl4
         cLAwaizvfhWn2L4u+9Kc1X4QzuLNL7Lyb04kHVQaLU9hISR8BF5K5lP3DIfIbFsDkLAZ
         J9t+ArjkcAC/MBR77BX9VnYOVigcD9xEz0bBNczIT+GrjY6eq53m6PvBMdMjih2DtHag
         N8ILnE/7l+l6oR3Uus3eP6lPqYB8HG/kHliB8XcVOVTX0nNx82uAazAHsrOZwCNFkZMj
         hChw==
X-Forwarded-Encrypted: i=1; AHgh+RqH5zVKDTNctLP0aMnGhi2ibDQwivdZnUu7IMlPPjT7d96XBjZFNnfVhsCGONC/jfoRZ6nYTrw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6TYBXxZAhAJyqXrPgcC27iMBjCBEQjufD1ZhjqhG8lmTXxvN+
	XYWGbP/Z83UQet2+Ob/CmV8Jz7Ym7RXp1+swGi+0HqHi6DCcrS+mHv+yENodxUV12da/tf+2tJ7
	bqpdDCDnZIQkDYOlAmuWIlLghpFxbM91xnD+bxja3O5/gf3MGJDRzcdclIpx19wO7
X-Gm-Gg: AfdE7cnTFgmpaCni++i1Q+Ko2ISpr1I6RgUEzjP9V3oWxbRUGwmc6VybhCj3Mj1gEYC
	+MZbJz4PX1rwGUH9zucEx4ZPJyDu2v2xo3dhpP4aR5dq0JMdoQ27QNMSwBuvkv4OVVqzRhtk5tQ
	hAwSpWkmPliSruZ6Xr2zNuefdp4BkXzRHVS2q9cRPUsJVq1ZEm9xVzGABP3sWLVtyexDG61SNdF
	Lxmj7DYiAttCKlcWImb2YMnYTlFubVGKDwga//up3rdyE+RGLAwzY4vsZU4Ymdui5KI0htVKkBA
	jmAS6iA3kIGvPXusEvEgc1PMLVpsMJX1ozplSKBJZAqCbJaC5l23u4rNRSm6qw1EZHBgjI91glc
	ahXis0uuTT0R1GP9EqhMV9PlWtFZKzvhanlN0iET9zOsd
X-Received: by 2002:a05:6a21:3b89:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c3ad64b57emr11236333637.22.1784469075404;
        Sun, 19 Jul 2026 06:51:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b89:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c3ad64b57emr11236300637.22.1784469074972;
        Sun, 19 Jul 2026 06:51:14 -0700 (PDT)
Received: from [192.168.11.101] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm27774316eec.3.2026.07.19.06.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 06:51:14 -0700 (PDT)
Message-ID: <a7ee5e74-f1ac-4870-b733-26f88e49fe77@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 19:21:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix survey indexing across bands
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R
 <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Nicolas Escande <nico.escande@gmail.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDE1MiBTYWx0ZWRfX8/4QPePsthZ8
 N9nWjdfpPqMmeCrsA0hvwA0rfkC8eMCJS7V4j1el355shZV13IS9hBevUyd4fwWTp7TA3Se0SX5
 rST966+Sejue/U5YG32MbDfRd/NT1WF/nCvmzr6vpboGrNudU3LNIWW6lY5rxrIwTEuGEu04Zht
 qmkHLRM3+yyzaYtLNneblyLQmY+u6A3ChaaMQlKeCJLBcOTJRcnmGhQbgBWdnXSj9/3aZ7F4L9v
 ASyDDlz286psctJKkK/qM/p0OOyzYWNNJqpJoM8LeaqhB/TVugoz+F6aD4ajz46HRJ2Tee/R3GI
 Q+JfwiY0OWf2SrlzyBrWsKARTg9deHOLLgZFBfLku+lNdxwi/Wt3aTmQsRFXmm4362hK4RkAkwk
 IImXSPw1yLbzOxWWrzrXscjT2/ounI71nLGlETDkq7sYfhttBSO8GBdpUquBlurwcF6jaryLkhe
 K8IuHWvns8vYh0nKs3w==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5cd654 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=GUBCPiHTW_XQuGLVs6sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: SwxnAo5xVE3l6SpOWYR8PTBVeNCmEiys
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDE1MiBTYWx0ZWRfX64BFwGy9SD/H
 i6To+pjikrNJnS0EXRPLPhUtuPBYCet4/DKF86a+HidK/XULHqf/BWpdEo4W4oV1/65VwSu9kCc
 mE4nF6ay4mKrdCJl0EWuLV1xT6hNSOE=
X-Proofpoint-GUID: SwxnAo5xVE3l6SpOWYR8PTBVeNCmEiys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607190152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_065117_655712_18A838A9 
X-CRM114-Status: GOOD (  13.29  )
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

On 7/3/2026 9:26 PM, Matthew Leach wrote:
> When running 'iw dev wlan0 survey dump' the values for the channel busy
> time have the same sequence across bands. This is caused by indexing
> into the ath12k survey array using a band-local index rather than the
> global index passed by mac80211. This results in surveys for 5 GHz and 6
> GHz channels returning values from 2.4 GHz slots, making the survey
> unusable on those bands. Further, there are redundant survey slots for
> multi-radio/single-phy instances.
> 
> Fix by moving the survey data into ath12k_hw so multiple radios under a
> single wiphy share one table, and index into it using the global
> mac80211 index. A new spinlock in ath12k_hw serialises access to the
> survey array, which is now shared across all radios under a single hw.
> 
> Band busy-times Before this fix:
> 
> 2.4 GHz: 9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 5 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 6 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 
> After this fix, times are independent:
> 
> 2.4 GHz: 23, 5,  5,  12, 2,   12,  26,  5,   3,  1,  27
> 5 GHz:   30, 40, 29, 27, 118, 118, 112, 120, 11, 11, 11
> 6 GHz:   1,  0,  0,  0,  0,   0,   0,   0,   0,  0,  1
> 
> Tested-on: wcn7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single wiphy")
> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


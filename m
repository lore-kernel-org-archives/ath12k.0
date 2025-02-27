Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DF6C197BF
	for <ath12k@archiver.kernel.org>; Thu, 27 Feb 2025 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIdrYWNQba7sYavgsAMvk6IcAs+0IphjbLu8WqnORIo=; b=VIVZJn29/I7gt55/yHmTUPoHl8
	//rrJ//yDRP6sgujjzomVTIREPuyEPKKM3hnxG6ctuA+dnfd2KuXWgHGqo0+pnxGF6s3V68uGYywf
	Tt3TQV9Zum9oMD+iAG9aE1BV6nHlU9EZHNVCjZjs24TEJejFk1xu4Z3g4vbmFjOqM56FH7Kxn3pB9
	5V9X6gB8ROs5bG0ztv6gU+2OGmH2WnIgRBXcPrbmKv6WJ3k7B2unAQOgbdES/wB/uYwWX3nNSdV50
	wxvQAB5Nc+TSIZZ6X7kkPHVjLzFHKrPE9ee5FdCXnVnH+/yLRv1An6GnuwJVun9DDJW5KuxAETrjl
	+UivjZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjq2-00000008gTp-3LAd
	for ath12k@archiver.kernel.org;
	Thu, 27 Feb 2025 19:46:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjfa-00000008TPN-1m4T
	for ath12k@lists.infradead.org;
	Thu, 27 Feb 2025 19:35:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9f7CW006109
	for <ath12k@lists.infradead.org>; Thu, 27 Feb 2025 19:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIdrYWNQba7sYavgsAMvk6IcAs+0IphjbLu8WqnORIo=; b=d7fsC86b/lJg6eKi
	T6JSwZDfbZkJ7fBYLkSzhs5cFU24q9snOBRM8zZyny/iSUn1zLJ30dF8VFZ8WtAW
	tn5G4PeG53/LBu9U84bzG6lHQxLIU6IjMm6bhoOLZ6yH2f6+t/p8YNwXMqEpw5x6
	iiBmap7OHJJ+5sxFThPoqZO+9DNTZfGgeZHjqDyWt52fGCKxog8ZwqbkJIopYiLC
	jHbijbgnuAatZgle6dl9YxaLxzdmHXA9rALkx2B9wk5dXeiLJEKjxNk3pdw5c8NK
	BsxOouSHyQgyA7QGNzlqni56lzQyptGunzS58ifppcRK8zjJnx8uJ6AJnIKQyvEk
	QfJOag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452nmqsqwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 27 Feb 2025 19:35:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1cb0c2cbso4197452a91.1
        for <ath12k@lists.infradead.org>; Thu, 27 Feb 2025 11:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740684940; x=1741289740;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIdrYWNQba7sYavgsAMvk6IcAs+0IphjbLu8WqnORIo=;
        b=KznyjS5SrRbEUWC1nsmQrTHgeBhqQXQuyR6TmujCJzfcxHPDOi/XyWasGWJZpduyCQ
         e/t7nmmlTAPnUoh7Lpg/0uhbj2xOBosysrEpiZjlaXTocIt8wgVZF/7rbW4jsAfuOHVk
         OYWKVvOmnbiArrTQSLB/owc4w9NnHjoptwy8n8BZdFSMRdBv6/kCQPKYn+bjXvQR5HIZ
         2XL9FZXm1Px2pPAQIkLW1y49vU8MDuIXQmhD9QKLyIAJyeVSbHxyifYA6kVmPKNRYuU1
         63HsWTbvvl7HL/AoUVqev0f8ee/699B8U27E+lForOAFc4QRtj5TfFITeBAMck5zDSL4
         +RUQ==
X-Forwarded-Encrypted: i=1; AJvYcCULNGI5EDQ2WqdUoNYzlIEbkM1mNwouQdfsv6sSb15Huzw72o/mW4QmuXY3R7XqVXuqakps28Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnTMADM6W/eylV0V5WUSd0dTHBaBVlk0ngFd8WjA1aoIGIZb3e
	i8A5X3YtnnwCMGfXXpx8VerQtJtjY0dNy0R0DRT6NQH5K5TKGJVXibbkHWIf9tDl6SGQYdkORdN
	BmBrdwdbX0ati31sSKGFsJ09MYYZMUMGZ7Tgfkhv2qxDbCxiqBWMNdopq2pn6
X-Gm-Gg: ASbGncssUTV2P2xrKZxp6bmZUkpuGOXQl2mVlN67g527i/FXgObscTa6dQIZJSN94AW
	noh9XoXfg4uNe9Jd2gOwt+cs926PWU8uVcMMhtvVV/EKsvA8t2y60lLq7y7qO+sZAKy5lXGbc+/
	0gC5zatg8RHCy/Tm0Qg5vslfAD6sMMHGF1FhfchaOPORtzsuqKZQQxYVUOFQQD7YJrGtxjwObU6
	iLxfQI+++FEG8LVWi3KfqIsUcxMN2sUm2r6AglPCuH9BSJ7hAaXmLAEUGts9OTuJ8LaPrEOWhdY
	stDXfiay4CCYRMoe4kU/fv6HfBUbyYibB+/uU7yjHS27TyZiF/mGkC4U5pfLcynmLvFnihQxRQw
	EelJyngGj
X-Received: by 2002:a17:90b:4990:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2febabedb80mr808675a91.27.1740684940283;
        Thu, 27 Feb 2025 11:35:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3NzBMPbwQFLBIWu63EVtr1wldOAZRJN12Z4hsFBjmzUFCNZvyQUZB2a0S4+5lsGUNbGo71A==
X-Received: by 2002:a17:90b:4990:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2febabedb80mr808512a91.27.1740684938660;
        Thu, 27 Feb 2025 11:35:38 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea676bf4esm2078772a91.18.2025.02.27.11.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 11:35:38 -0800 (PST)
Message-ID: <8bccb677-de56-475a-9b27-ccd55bcaebc5@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 11:35:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] wifi: mac80211/ath12k: add support to fill link
 statistics of multi-link station
To: Johannes Berg <johannes@sipsolutions.net>,
        Ping-Ke Shih <pkshih@realtek.com>,
        Sarika Sharma
 <quic_sarishar@quicinc.com>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <20250227045824.91480-1-quic_sarishar@quicinc.com>
 <bac3fdc3bd39e45150e5b7d60be01b5d732a04bf.camel@sipsolutions.net>
 <df26e3aeb3724d969f444eab65d8c872@realtek.com>
 <900f042d03d34385fa3507610ae291a36ca4885b.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <900f042d03d34385fa3507610ae291a36ca4885b.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3jeDOf__sCS_jcAjHX-yQUbl4ZeNNvAk
X-Proofpoint-ORIG-GUID: 3jeDOf__sCS_jcAjHX-yQUbl4ZeNNvAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=681
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_113542_477077_70B7E46B 
X-CRM114-Status: GOOD (  12.96  )
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

On 2/27/2025 1:32 AM, Johannes Berg wrote:
> On Thu, 2025-02-27 at 09:30 +0000, Ping-Ke Shih wrote:
>>
>> I have encountered structural (not functional) dependency problem too. 
>> Could you share how I can tell NIPA the dependency between two patchset?
>>
> 
> I don't think you can at all, at this point.

So it doesn't support the mechanism 'b4' can handle, namely having a
base-commit: tag along with one or more prerequisite-patch-id: tags?

(note this series was not created with b4 so it doesn't have those tags, but
just curious if it had been created with b4, if the patches could have been
applied)


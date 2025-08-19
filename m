Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA04BCA0EE9
	for <ath12k@archiver.kernel.org>; Tue, 19 Aug 2025 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Qq/aMBe6WA4icgWdgRmHu9HjfiTSjioB8bzv4f37ps=; b=WOR0WEb4D5fRXfXt4EsP7F5wtH
	XcSan5y+WdAYkAuW3110OPBFqiDKyT00eXnxhhVm1bic3RNEg66ALDOd5mKJolnGARcg/tos+2x2M
	n9VwxODiLDiQ/DRZKGBUDMn9Uzg6sXTJQnf7eeqgBF97rZnQJ/2dOnJR71WXxvvnpUljGF8XlwYgn
	0Tm/ZStjoYQU0Yga5yuoZcSs+7m9RVcRDJAee60HhYiYkuhl+lOKD/2D16qJR5qoit2ZQhw79Qb9t
	hZnZeSCCgDWHfaFqOZvT9Nh0DmKQUGlEZflZb+saZmVQjTxMBOXsR6x2jHI7LOJImIcUz1rcYbFJl
	x8aKVF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGIh-00000009bE8-21xw;
	Tue, 19 Aug 2025 06:58:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFza-00000009YdB-1KxV
	for ath12k@lists.infradead.org;
	Tue, 19 Aug 2025 06:38:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J1lGR1027718
	for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 06:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Qq/aMBe6WA4icgWdgRmHu9HjfiTSjioB8bzv4f37ps=; b=cXBx3+GkykVB2H/+
	rclAvJg00+PXYq+P1x17sgD1TMbD5Mr0kkctnu068m/FosJuNT7d0BALR5K22p0a
	/dUdXAemP0M4HkqjYkI9pWZik0RToD2Iv6sdHhSVijNoFQvovqmzTvOyF9uv0kvO
	Qv6bfJXiJenCa3GzevEUxRLdm0ZrUsewskNeNI0Xj0+58rWumfk29GUeFnUd23DM
	Wu5weD7jy5HoFyCR3TEPHsWf4FO5d59MAwbKXoEn1lsRODVAYEShrbe4mRZMsw2r
	Kbpps1z79DH3QdawTiOKd+UOn6H+YzATOxP1fmz9ox+2sI0WyBmvG/Exex3xXRM9
	Qge4fQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mfcke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 Aug 2025 06:38:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-323267858edso4989574a91.1
        for <ath12k@lists.infradead.org>; Mon, 18 Aug 2025 23:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585524; x=1756190324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qq/aMBe6WA4icgWdgRmHu9HjfiTSjioB8bzv4f37ps=;
        b=t6FV/+uxBb20JQB13jWUV8UbgRZldOQfTwm1xfszp2FmwhYKrINWANwh+dDJenV+mg
         mn42q4Js4/W2CynEo3f4RU53JZHYJsppTLyieOOoCOcMJ8+04/CRB8EniWzkPyZsvCK7
         VsW2hIdZhmccWMy8s9r+dcnvstwFCxKzRduU4n2KpHSQy5k6NwCN5eSXQr3+N/FcTsA+
         kh/rmn54f07YHV6leIPLviOL8OqipD6uLpNJx7MZBL/umgb4aQpBq0fG8PGyONkIkAII
         TgIdaZ/dszfAUpdTg1IF2VVmpG0tG8qxBtBLgxcQoVeX/yhR5GyVxg5NmFbylKFCJjxe
         s/wg==
X-Gm-Message-State: AOJu0YzqANMGv/w42cCy9j0i47IJBKMnBlMlMCmn/ZHFp5gY+P86dAJ1
	oFRoyyNuBXzEiQki6zNfNju9ipxKb3MLDFotDeSh5SsdwCZmGV2Gc0oj13/+NMde9Cf2wtE0ZL4
	UN4VdsCP4b7BqO572itrWTiIfJR1j8qN6jHcWW0sXQH408RPkDDfwHQQFEzHHbFuD
X-Gm-Gg: ASbGncvP4ltpKP4ZJvtz7bF5hnIJ9yFMxTWYyD76vEUxml5Ihm+xZ7OJpcRLt3d0dBx
	cFKw2H88zJXVwgerfYSJ7QTFQvYtCdYMKT0Z09Csfc6WjfpfEKfjfpYSVGolDOgSnEF/JrjuD6r
	YX3PYriGYhH4w6F+EJsj9BcTNd/lTln2w+DL0Vj0+NjWxJ1YE4GpjFUAqAX3XUVTkYpKyJM1QwH
	FRF5hYzC0Fk1nvaNjtyyBYe0wzxMUgAKFj/0lZb09z88bEl6YCn1llv8lsaqXo2xwSrHUbZTapz
	TdXIaeTw8Eg1o3taqEWeXM7J0GYVnPNs7H7eit+mNr5pKzZ9Xau1KIqhVHFL3U6xYJ8YjHwGlpO
	DWptqBy+HXZezvUHsJun1cTF7YzqOYTYIROb1
X-Received: by 2002:a17:90b:5746:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-32476aa1cdfmr1843078a91.31.1755585523828;
        Mon, 18 Aug 2025 23:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQYE9o0BkXEZqqGhwXwAEvO5q7mg3A9ZGePOqkdZyzZsjwzpO4oWulSOZ4lo2KN9r2OZ7z5w==
X-Received: by 2002:a17:90b:5746:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-32476aa1cdfmr1843053a91.31.1755585523326;
        Mon, 18 Aug 2025 23:38:43 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76f9d5sm9646108a12.45.2025.08.18.23.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:38:43 -0700 (PDT)
Message-ID: <d6f0b64f-1764-41cd-a7c5-fb34d034ace2@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:38:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: REO status on PPC does not work
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <aJ7sDOoWmf4jLpjo@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a41bf4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=HThdk4v1ZfnwiNzKKCMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 27ckf9rMagr1Hvh3TiY3P2cYxit1xf9n
X-Proofpoint-GUID: 27ckf9rMagr1Hvh3TiY3P2cYxit1xf9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX4oZAFOjlgOFh
 zMLU3nTwTRRacAU/6bZ52cz93UdM/06w+sYKvC2X+ldjZSFTwBk6CBwGKYuAupzY5A3bHMxQDEJ
 Ok0wf0nyR/l5U5DrCe7noFzD9p39DsxKUcq7SXdy5Krir1makzu5QpStiyiHVAKpWeop14B0ORU
 i7Fhg8m/cPpzfbfKPDCFHw9JpbNcxGANQkGLCNjfVegL8jV56JRhhoRyEzTZkSt5lW8web473uV
 e0FC1f0r22MyY5Mz7bOBBErTnbq6TK0tCZA+KmigPRtGn/G8pn47svniol1waCDC4PwxeCJOYTj
 BAhgFLpzYWjTs8PL0MHXEPhvnNMMeq4xmtGRoMBQAFeh1dFPVTmZvtBozd6qLRrKarW1uW1oUWS
 enizFsJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_233846_406482_FB393C95 
X-CRM114-Status: GOOD (  18.78  )
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



On 8/15/2025 4:13 PM, Alexander Wilhelm wrote:
> Hello devs,
> 
> I'm currently working on getting the 'ath12k' driver running on a big endian
> PowerPC platform and have encountered the following issue.
> 
> In the function 'ath12k_dp_rx_process_reo_status', the REO status is determined
> by inspecting memory that the hardware has previously written via DMA.
> Specifically, during the call to 'ath12k_hal_srng_access_begin', the driver
> reads the value of 'hp_addr' for the destination ring (in my case, always with
> ID 21). On the big endian platform, this value is consistently 0, which prevents
> the REO status from being updated.

This does not seem an endian issue to me, because either of them we should get a value
other than 0.

> 
> Interestingly, DMA read/write accesses work fine for other rings, just not for
> this one. What makes the REO status ring so special? I couldn’t find anything in
> the initialization routine that would explain the difference.
> 
> Could anyone give me a hint on what I should be looking for?
> 
> 
What hardware are you using? WCN7850 or QCN9274?

> Best regards
> Alexander Wilhelm
>



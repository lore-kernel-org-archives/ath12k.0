Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68810CF34C5
	for <ath12k@archiver.kernel.org>; Wed, 19 Nov 2025 19:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txsRffx2z5dci0osZKf4njtB+LEONXPzlw++ycP4mTU=; b=hJQ5hqPFIKbWqY/fFU1yKkk5sm
	Y6sYTzLDss7wt81B+FaFAdeTEJWSfaan0gTM7TmZPotDrOSZWyOdI7MRrTkgy8FUW2OV4HEU5bECu
	zueEs3cHVOb+sWPlywM97vPvK+S3pIxxDHjvKxlWeqy6bcDXVMjkNBKRRbbrz5QMGyKoJb0fy77B6
	pnxESkhg4UKrt7cU5o9NaKRTpIWrFFs1GeLkBmdL5RsroMxlQiltHb/w06IMp2ejaZZGAHi92hnfI
	N90ouCyLH/HzR5PMg3BjcRF4kgjcFeJwNlBtxB4yfX+Jdh0N8ozXbOfFIqDo+qcCDTWMhnB5fSdUm
	SEFd0XMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoEw-00000005DHg-0aj8;
	Wed, 19 Nov 2025 19:53:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLoEu-00000005DFW-0no9
	for ath12k@lists.infradead.org;
	Wed, 19 Nov 2025 19:53:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJGFcDT1970072
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 19:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txsRffx2z5dci0osZKf4njtB+LEONXPzlw++ycP4mTU=; b=B5zS0Qh9utJ5L6cx
	UtaOPK2ihxZ1o2OpH0tVT19qgznmgeJY0at3BlVr7spL1a149xL6I465SWdRhXKz
	c0oGG54rBS15A4XaQ+4/HauELtgLuRbmlaIA8N/1zX56qfLdYYgFa4eUV/RDoUip
	wBCoOu8xC71/wqvLgBuaNE2LLb9ena2F26DUGCLUNrSJqWJ+Z9xOSG29J5f4027P
	a0VqbMTb6YQBm8Gx22HG6mNmiVV3RFwRZvqPFJo4TFRKeOgKCv4/9XbDpTqUxdfe
	jbM08I9NkZ9yQw8NjcT7I/jNQb7xQvLViO9txRj4oFE7UK1rTVE7QptNhayCWtkx
	VQjurg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t0nhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 19:53:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34188ba5990so156384a91.0
        for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 11:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763581995; x=1764186795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txsRffx2z5dci0osZKf4njtB+LEONXPzlw++ycP4mTU=;
        b=Q2DdXICP/95aj8r+664vnJOQjs2/RgdxbtOoNFzOv7Ej+a9bnC05sT+XuXpvsqFtj4
         M/1P0SL7mHHFUy0brrFCYer3ZZq2VfOdL1tHiIoYhHL4VAbFgyAvPSuVK4w5jiJ0rJwH
         mL5BJhsmjNOp99yfL4Fz51Td8Bf4WGKkDZcYHslodyKHwYWmXOFaWg+4lmrQ21AoZm35
         7i8BWOR3X3iQnmql/Znq/OQ8uPafoTaF6v+gJ07A7fOr9dI0iNWkdqxoonGGPyg4cmi+
         d97S9UHBVn1cgbiwgHo1LsrAOLUxjkQVEELWMdNcitw8RH9/5HVFFXdSnaAmgvHAWRPL
         ZNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581995; x=1764186795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txsRffx2z5dci0osZKf4njtB+LEONXPzlw++ycP4mTU=;
        b=foUBnfX0qSHymgGuUzimymwX15Zn2MZsehebmp+CM3uxnazbcOyRNfZmPtZStEO1g0
         lLRS0nhq5SqHrtGUvao28uvkcrAfIiEskGQP77QmHhasLyGQw6WNSbcnEGxEQHPlg6nJ
         OxooHxKmgNSNMtyrQAqVOfIFH3BzVtDkfJueVbSGgZ4fHq3Qg1qls9vTCb4gENdWmtyY
         HNvx8sx408U6cr4J+5eo0o6cV2cljIOvfm+ncyvMYDuIEiqIB0YNHTFTQ52Mg+uuFFPg
         A0Oyqe8bgi0M8+7VgfvRVfbmFS5eXogoyKLyRhm6s5XZabuPq9YQr4YCRkSQxw7CkkC4
         gHZA==
X-Forwarded-Encrypted: i=1; AJvYcCWhE3I6UTufYvfcXBFQPRg4hGw44JJdNVpwta1j8K4oLDLsRj8+CXXNMdu8miyB0gc3iH1ewE0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcW6G3Isr1mKq0kQWvzh/4iD2wTiiEsimDZISvWI1E/z8vqSb+
	R5hcbag06qYbnVsieax4Hsv4qGliRMtDpKhvsyKM0hwcnZicYhPmWiDK5LO4K/78JEJmFIjNh8r
	nl5VrBQE5tqw5tI5VQQAm77pAPx1ew+4fAqk+UNFnIYpXhdy7YMMEWWqPH2NON2fOSnxa+0RF
X-Gm-Gg: ASbGncuTF0yW1h0J29dgouXHcfGMYkVEhVd9Ibq5e9go+fuENmHgwsIeOobXyhpR8Bi
	E/HJ32FoIqeM9NBVYF1+q9+7CeE4rnJwWVCDGofG2OW947dwafgRslGB0KeQvOuFMjbXR8LR23C
	N72qfiZboGorEvejM7bi7cyUgnavevqziw6OpzM87LiQ/9PoaXFFBcKUshInJ0L1ahXdc6pMp/H
	wGfh2gECfq6XREPT9Z+1kHj+OndidKGvrEHP6GHEoMXM7fxvyBHnTfU6wTXlLtrZXQ/KBEdfiZv
	SZxGwUuZoR8p8QuxUwqu5rJfo4jn3FY9SQrVXB3TUOdRWAvwQofvQPwUZQThB9Zpvgp4yQgqcl9
	RxHDSkh6TfHJFFInjEzYtATjZuoVEgxc200SPR70xFvOKKA==
X-Received: by 2002:a17:90b:558c:b0:341:d326:7354 with SMTP id 98e67ed59e1d1-34727d68093mr333300a91.37.1763581994601;
        Wed, 19 Nov 2025 11:53:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoZ4HuTkismhMzSeuYt1Q1rICYobswYfjT+1TEBv8W7OiokotZj613ZTQzgB9boFQsZELt3w==
X-Received: by 2002:a17:90b:558c:b0:341:d326:7354 with SMTP id 98e67ed59e1d1-34727d68093mr333271a91.37.1763581994075;
        Wed, 19 Nov 2025 11:53:14 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b0512211sm2646721a91.13.2025.11.19.11.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:53:13 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20251119-ath12k-fix-missing-rcu-lock-v1-1-8155de1dc4fc@oss.qualcomm.com>
References: <20251119-ath12k-fix-missing-rcu-lock-v1-1-8155de1dc4fc@oss.qualcomm.com>
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: add the missing RCU lock in
 ath12k_dp_tx_free_txbuf()
Message-Id: <176358199346.3002662.16180061512061490406.b4-ty@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 11:53:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691e202b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fpXTjR_PzDRLIX1BWiwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: _VOpjMczYa03DllCr3Mh0faXCFtFPDk1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE1NiBTYWx0ZWRfX5f+LTRTtPR2y
 qbrtyPd1qh0Q9ezwUl8qP9dLkz0HsGgXkNXcuYl3mRqH0EqOueZxAKpj/BxRIH3CKBpgYcvbz5l
 ED+ytBBCSMbd2nFUu/vBJrTVg152r5rM0JMsv6sk9rmmfo9FrSTjXtZTdVj0za/0SS2+liFABZ8
 IKCsa5xvJ4Z7IzvbuJLaufO1v/ccaeLeLAsJjjZTzAIjG2bxD4avm4jhAfBsstlIfN+ECGRJcpD
 ZbRRaiCv4mftQCR1Z5bFH83vrNdMxWjYCWtLQqWTeBOgRuNYBA2tboxjzhmyRphLltUjH5/AnoP
 IoD/hV5vwStTChZwp0oJ59p89B/VBWZc4pjj6bKq5PAizgwPgFK/zjA/LzT/6/dOsh57GSqAwqJ
 pNljgdviGv3Oggar3DcOO2cH+Dpx+Q==
X-Proofpoint-ORIG-GUID: _VOpjMczYa03DllCr3Mh0faXCFtFPDk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_115316_269833_ED87618A 
X-CRM114-Status: UNSURE (   8.13  )
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


On Wed, 19 Nov 2025 10:15:57 +0800, Baochen Qiang wrote:
> RCU read lock is missing in ath12k_dp_tx_free_txbuf() before calling
> ath12k_dp_to_pdev_dp(), causing below warning:
> 
> WARNING: suspicious RCU usage
> -----------------------------
> drivers/net/wireless/ath/ath12k/dp.h:653 ath12k dp to dp pdev called without rcu lock!
> Call Trace:
>  <IRQ>
>  show_stack
>  dump_stack_lvl
>  dump_stack
>  lockdep_rcu_suspicious.cold
>  ath12k_dp_tx_free_txbuf
>  ath12k_wifi7_dp_tx_completion_handler
>  ath12k_wifi7_dp_service_srng
>  ath12k_pci_ext_grp_napi_poll
>  [...]
>  </IRQ>
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add the missing RCU lock in ath12k_dp_tx_free_txbuf()
      commit: 5a384854d81f83d59d812b54bfa27fd0e56e36f0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



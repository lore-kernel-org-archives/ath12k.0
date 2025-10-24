Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F31CCF9E0
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V6F0xq9gjnOgNAcXk2tN5OfB5dID9k3MmSC3lL6enc=; b=bjaRPrzHBV+drv7BvLHCsbazdR
	x320OvP8gppnkFZCLjUMV8rdjA3a3YUIGcDOVU7qKY1SVEI6dTJKKpxpXnCYMDEsvg04ZsBIb5K/6
	KpBZGDfoEjPf785gCtTOgCOZkn8923zlePFRrV28b7Bc1h9WfwOW1yRafvf0H2i2aIxty+3LIi8rw
	zENXIkYuPBylgjaRVh7zWy3/FbUi7EJB/Mz74UgkaCToak7CUNINh+LcPgLCpq2X5JzwMbyaOm7Lc
	bK32lbbjSfRPqPkTEJI5t0oB6xqKG6C1Qw75ULe96htDF0FRwVu1FZJXl5+hnSBnsCClBKzTTSbDj
	/r1sAG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4P-00000009hR3-0t04;
	Fri, 24 Oct 2025 14:47:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4N-00000009hQ5-0OJz
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 14:47:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCJPsn015632
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 14:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6V6F0xq9gjnOgNAcXk2tN5OfB5dID9k3MmSC3lL6enc=; b=TkMmepsCqekhJcqu
	deaxfxy/uigiAOx24/BIVa/olmKwmn59i4SsXvnme1nxBJXUwW7jUEepDyuSPdSR
	DqFckZ4hLLW5gOVx7szbfjyI+jPUOd5dutUelNxHhuzLNW/8wd4GtJMKAutQDuSb
	CDq+0+1HYKm4dh09vnmJqeCQIm8Zkd0Qxnzifc/b7RG0GpczMneu4apygDJn7/ES
	kJhbexY89fvWgx0jdkrD7rsqZmj6aIlPJr2/Q1IOaDp47UO1cnWmBM5NLOXbsfnH
	W6uPVGA5sXZ3WQiLWskl5GPbbk08XjQ5tgWuYeFVs69jMoyoU+pCX33WzBDQurfF
	2LIIvA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpshxa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 14:47:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290d860acbcso41995255ad.1
        for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 07:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317224; x=1761922024;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V6F0xq9gjnOgNAcXk2tN5OfB5dID9k3MmSC3lL6enc=;
        b=V8GqMhyXmyaaItWIE2ihEdimD/wuKbocYhsi2Hyvoh2UaM8w+srZtsHsUTWPA2Ad5D
         0DPEbSZnQe7xub+qrD5Qxq5JYvZAe4ofAps7+XI4KIZ/Q/CmKzgVvOBWt9alUgp/rXuB
         TyMEs+sh1J5gU/e2ILFkXIyoy9QKOPG6/Y3VMhMEBoH8uvz1x75DCBYg6XR9UQPGCnfl
         Y9fWRD4PcUX1wsiDBJB8yJrtG7Ll81MUtUb4R+9ZLMR9gdLlbjQm8r5HMI7QGk9FxqcF
         4h4Kx2V8Cu0/XmGToMl6XrAgHp7GQFVolHwu2WWL2S1fhyg9Bll5a0HzP3hDXWtmk/G1
         Rjgw==
X-Forwarded-Encrypted: i=1; AJvYcCWY6V1TvQqpQG95TTHZ61ZJf9kqqppXb2a0Wr9zv79VcOlbiBwH6rmxI5Ax4ao8RkDzHOR1f2A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeT3deMyJ1HN4u+RqWb6GNJ2WAolns6HDblgzAS7dr3/FSUuU0
	lre9wi4gxaNhEskB6f8AYwK7wJ7o90wiFrM1PrZQ2cdBA85ISCFiH86CLsS37RDFFeYWQ9gPW3J
	hN9Qlh3L7WAHNhIp71oWSNR2J6OKr7i6NM/EQSNBD6PmjUx0QGGXIClhD2JGUmuererifOCQT
X-Gm-Gg: ASbGncvFt6WtcTafLHSoxJ1rYLwIiYqhQqqLWvlGDxNj8WR6dIwaKcaZXF94emzMf1n
	WekvXL1cDlId74ab4lxchOASDcaGJOxrvqhmc2IFaziV2G0/j1/EHhnLkVdPyZ3jRb1WSW4Q/U9
	sRr+TYr0RNKYp5ciuOtC54bvxiTN/eZex+C2x1a7x50ReVGSWqCKT8jY6tRGz3O1UXT5fX/k6Jy
	4gRnKO89Gj6SUuQdKlKHKBT+iq6CkZbDIHiswi60mmpxYlTvBkYiBJQ3pT2p2vbBc9og7mfvahh
	k744DLVEXcIOzVm3Ua09PTNZMh63e6Z9+AD9kfy07BMJNUeERVhK8cNsnepKpICVhVcJGCslB8I
	JuDyBzqEMKjBJoAcmD0sqS8v675/A252ZLZY=
X-Received: by 2002:a17:903:22c3:b0:293:57e:c8a7 with SMTP id d9443c01a7336-293057eca74mr118517095ad.23.1761317224400;
        Fri, 24 Oct 2025 07:47:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/N9mfDdUkFMrFduZyJ7BJqc/QkAT49hfYFmk8eMT9eQd48OzYInqmsbKv0sBuWn94u3Gz/Q==
X-Received: by 2002:a17:903:22c3:b0:293:57e:c8a7 with SMTP id d9443c01a7336-293057eca74mr118516605ad.23.1761317223665;
        Fri, 24 Oct 2025 07:47:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda5771sm58169035ad.18.2025.10.24.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:47:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20251017-ath12k-reset-window-cache-v1-1-29e0e751deed@oss.qualcomm.com>
References: <20251017-ath12k-reset-window-cache-v1-1-29e0e751deed@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: restore register window after
 global reset
Message-Id: <176131722281.1606896.15789445114117878112.b4-ty@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 07:47:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX0y+8NVa8IHK0
 ifYGHXQKb46VgcwqYKg0mCOHgcBsczaeR7JcqAVii63undfiCtj3d8cRt0BR7HI6uHdzin3r8Im
 4nAGg3wwA6LutWuzGiQlX4e9F73P9YmAkJ/1XpiZClLrLGkTHTPLT28Nt88koQDZ+rxI+VTpWJM
 bteUwhEqOEux6lNa8q626rcQGT18lB5FOvwgihwgzDdPp/sGnTS1Ea7RhwfWY1wEJEgSYbEztt5
 rhOCgt/mWa15f/zblwdc/+6+cjgtkZDriENViPrX3JIPGJzftGpvwwHHlI4nMDWXqyRvansYaWG
 68KH+ELv9KmqxiSn1Dou4o+10ilq1H7xM+HrOGRQsJZCwSMCpj1GPGhjcp/rYMugTbG8dQpZfkL
 Z8lE71Dm/v5uU1pqd7cCYF3ydCz/xA==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68fb9169 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bE-cqvqhFDU5jN8ZjzcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ajWXAV6xXmzWNBM11XTOyzia-UgMQiUL
X-Proofpoint-ORIG-GUID: ajWXAV6xXmzWNBM11XTOyzia-UgMQiUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074707_139415_590B42F7 
X-CRM114-Status: GOOD (  11.32  )
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


On Fri, 17 Oct 2025 10:36:36 +0800, Baochen Qiang wrote:
> Hardware target implements an address space larger than that PCI BAR can
> map. In order to be able to access the whole target address space, the
> BAR space is split into 4 segments, of which the last 3, called windows,
> can be dynamically mapped to the desired area. This is achieved by
> updating WINDOW_REG_ADDRESS register with appropriate window value.
> Currently each time when accessing a register that beyond WINDOW_START,
> host calculates the window value and caches it after window update,
> this way next time when accessing a register falling in the same window,
> host knows that the window is already good hence no additional update
> needed.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: restore register window after global reset
      commit: a41281f6518e485220d180a6031d302a736fc463

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



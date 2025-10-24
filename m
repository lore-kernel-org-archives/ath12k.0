Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD731CCD1BF
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBILhy27+2RI7SokS5+wrcGFJ/H7/tAsJKe5n8CCO5k=; b=afBtubmHUvdUwvILisdlOD/ich
	LHp30fo41YLY8mh9jhyQw1VN3yTynwlG+uK9CVGf03Zc+eBQYPSypxkhMpZ4+he56YBAZ3lxjU6FB
	IQ8M0oU7JST3wuqL9QdHoYr6gTukFOpxsu4P6t9AiedBIZlJiPumsGnn7olSpyKPLKmeA1rJIiuxB
	bc8GiJu0mzNSqp+aDPI5wuhE5Yv80NYYBjU4LkZ8OB3CvdbN0DDKJNcH/IOcJmHT+HZeN3aAOLJ57
	R+G5b5Dyc4EZs4oMXxnlTrqcqhPTdSo2ysQFE9mY1AOVeIK5i/nOryiIIPMJTxhRqg7hEwwL2R8c6
	0Fss5G5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4P-00000009hRF-227p;
	Fri, 24 Oct 2025 14:47:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ4N-00000009hQ6-0UMB
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 14:47:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OBtZFK006164
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 14:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBILhy27+2RI7SokS5+wrcGFJ/H7/tAsJKe5n8CCO5k=; b=hbn1D23M8vETQ/El
	9KPfOmwMO+OwWKqg6OSH0XGJ7aULkqoZsyJyhwb+FUL7ZqlSSG3/wqh+fQ84LRLS
	O4zLAYwz4bYNF0elGJIIFtM/rdN9yUKWfr2IjsxFlcfUbQZTiCXJhu/gq1UFc53j
	oiallWzkgmQPtGa+5DNRyYNg5JUS4nh9iQySCbB5C6oiKheOpxFD69ZD7Qb+mxb3
	qn6kkpP8q5zhNQMMMYvBN1bW8d/w0XJuR6uNMJ8db32oTFO00vNsJNrGO1Pm+rEH
	yqYfXb3ZEWD7Q+8OPKgl1mnITD5jTte5/LSVbespyy0v2kDrYOsGEUZ5/PjJABMP
	RVkTKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v344cbve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 14:47:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290c9724deeso20017695ad.2
        for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 07:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317225; x=1761922025;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBILhy27+2RI7SokS5+wrcGFJ/H7/tAsJKe5n8CCO5k=;
        b=YMrzEl0v/8qB93bQ3GrMaLUWjHzu+ZxIkNEsMWa+ucQynjFx2DsnL0aJ6GpL8GuMlh
         OFXdCoSkQFWqvmI+uCxyjsO97/vK2Tzsk5f8HkktINHsePa1EVxGqofzWYaMomYAtgBS
         h7i+ebNOjfUav7j6qMeztZybJDg/QUbpll87IEDt4SKWAdOa+JeENpLhs0NSprF9NP7c
         uGUaeBF5VjZDVMnM6gzC5hnJIWWNB3YEXY3GmrOtv2qLCHdilf1331JyGvZH7obVGR3L
         4W7m6IgBnwfvD8Bg8y1PvqBkdaIekj+n5wbjyp1wnX7em/oRcwoogmiuN1+v3SLhy75a
         ubMQ==
X-Gm-Message-State: AOJu0YxCSyQVpGHvNhEY0Yr+fjQgW7hCvZektpJ7ZVDbNXjw5Jh3I7u/
	QvQJVC1CiB2my/WHYQsYeTJEENq/Tf/NeoM+ejQSV79aE7NwjtVUaasvNBZvRjoMuRGcnoiG4UR
	GFDROFuFWag1T9S0ATvtdF9Mesf0LSStst5LYQispybB3eZQVl0JJjm3+x4RilinUSB4C7ldm
X-Gm-Gg: ASbGnctrUbWVHWy1wRZjS0+CUMendnPz5n9mclUVPVEGe1NVPCaNGkPnAGrzqBCWTjI
	9wM6QecLKB8pKXFS58TTDsMCbz/AFk8WRaY2m46xtdh2CIbrlzr812g7RUY3Iz96O1jd9oXAiZ3
	UpOTRpSbKpYgE5Jra0+CH0FiAZ7+3dlJH+R8q8KypPozukEEYfQu+m6ZHxgNdjx/EYU0pVkRZDf
	1qiAcKZyQcpDQ2kCXjWKEWpv7WO8304icVivA4QKqSihHhOplFoNkbQIJLAFiVeap/VSDhHgnsq
	ByTvx6SvUqoR0QPtWvw8l105pASGHnHGxUedPDl+paDEZPVbEfFbqCerrjTsSP+is7mWyri6Yxk
	wn26HLwJydVqXIvFJMG4VLVmWwCgNVUX8suc=
X-Received: by 2002:a17:903:2947:b0:290:bd91:d81a with SMTP id d9443c01a7336-290ca1219femr287036515ad.39.1761317225038;
        Fri, 24 Oct 2025 07:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBgoxcbYSJM9TtndNQqy834Q05vrMbFb7CpwJlWsSb6yr/CF/SsVzCinG+iYcgSfkEfvyXyg==
X-Received: by 2002:a17:903:2947:b0:290:bd91:d81a with SMTP id d9443c01a7336-290ca1219femr287036315ad.39.1761317224551;
        Fri, 24 Oct 2025 07:47:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda5771sm58169035ad.18.2025.10.24.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:47:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
References: <20251021112204.323242-1-sarika.sharma@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Assert base_lock is held before
 allocating REO update element
Message-Id: <176131722384.1606896.6032640514752173500.b4-ty@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 07:47:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: F27XDhi_Y2juL3O9TyDXf2D496FUYDHa
X-Proofpoint-ORIG-GUID: F27XDhi_Y2juL3O9TyDXf2D496FUYDHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXx4Kx2oXcQOTB
 vKhh8eJ6OvovelcmX38gj1mdET1lVCnvoZsHazC4Jc1ylfK3cdaIouweOJDWtzr6EvBZUECjGBn
 KglfmfW0mZbJASPxZWrhWuxc2QuCUezUnTZruQvPlhG+YMvv8W3Cdej32ri8kM+5jSkldM/49ZK
 cGor9AI3f3O7rnUtPGWU4E3+ul54qFCCHuJGe8Tt8hO6ziXhq2DLuABQTSZPCJz3jHbJS/t+xrF
 BvfpBMd1HGt7XOGaGbmUjd5Ove7PCCQAFgDYHzYD+O9iYxLoOQaH5NCXEoEEob/ivHETkTyIOxS
 nFk5kDbyt5qK9lbpJdop7n4FutLx3ZpEZ9YztQf45alr0ox+U0BUuOlAquoY+8oIjgZE1xD0pPs
 cqDnBx4wwDGmR1cskcWM05UEr+FE1A==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68fb916a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ynOTO_sPihNLyZ3iqyQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074707_158252_E373BCAB 
X-CRM114-Status: UNSURE (   8.72  )
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


On Tue, 21 Oct 2025 16:52:04 +0530, Sarika Sharma wrote:
> Add a lockdep assertion to verify that ab->base_lock is held prior to
> allocating a REO update element in ath12k_dp_prepare_reo_update_elem().
> This helps detect potential concurrency issues during development and
> improves code robustness.
> Compiled tested only.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Assert base_lock is held before allocating REO update element
      commit: 197498315de711140bcc4722fdeb7c1761777100

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8EAC624DA
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nex6/Hy7yvNVnJXvkcKmaAHxT5UgZV76RueF1j+QKlI=; b=m1EIM2AaxgrhmtIOWZ0+5aQ0a8
	DYfm9xoGiGZnVmRuBdxougjl+eJO7B4FAYxld59kxHtegMRrDr2LGLx3CzBDke8cmRRWi0MFBanLb
	zrXmOeu+J23eYAkyv6SwXStdzWvFNqtg8p9InTpQ7l+ulyfotPhsSYQAnvByJbbWobG2035taj6uW
	H3Yv6V+jj+5wnBkJA7eb5LuHB+ZfQbgOMroyYH6YnmyyZJYZv+rsnS8ZpUVAtW00UHkVAFYL6vXN5
	PaHwokujk1cMD5iglXU8Buuda/KSS7ETUjEFrsFUzqACPG6ieckEB6lIimSzDrqch0eT82q4A2CtY
	xd4VgtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci4-00000000QO6-0al8;
	Thu, 03 Sep 2026 19:02:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci1-00000000QLD-1Rtp
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G35Z72088727
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nex6/Hy7yvNVnJXvkcKmaAHxT5UgZV76RueF1j+QKlI=; b=Jym/1K8at158d4Df
	3rENkWOFzgdiXgxNdlbAy2NuC9d9fazVYFlFA1ivMIXPpFwZEjJestX9EGqy65iG
	44mmdT098qsuXDbR3oDHfYPtwEgbO0BEwPmFFTQ5vws8ZII//b65n14gS5nc2al4
	yoaqH+VUom/EIMggieEsgITihWPR1lVv4n4SIZFfJRDJDUSLhjd/oU5Y0shy34/o
	MPVA16W2FWMOcznbbdZXZtGi5y8HNrJZEHArcsyf8N+XMAubSi+56fZ8Hl4Yg2NX
	m2mFyezvQJVTzh811Lw9dsg01xQtaITW0FmJxv7IjP4c/xeToLMDfgqyHOOq/dom
	7LsWmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b19sc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so2184515ad.3
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462168; x=1789066968; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nex6/Hy7yvNVnJXvkcKmaAHxT5UgZV76RueF1j+QKlI=;
        b=hxWZ90VYcEZ/yeviLowsjH9hF1MrssZKqhapxfx+RoNrdUF1iJ97DBDzJh4hMt/gb1
         YE8aTm9mrEMtofny5bH4eEnNMQabVh2cDIkDKE7vE83Y8pFVVBJUWcL8KEnJET9I9uq5
         wk694ZSztDHw8vyfyH+BwpN2xotkyBeom/ztWcERpW8wPgS8ulfxoNfZPjv/+thB4oHz
         PxxWZU9zo7JHY9bRncUAoFh10siMQF1q5Byd1UPqg7CXHip9lXkSya9qbQm3NuilnHx0
         blwasb8Xbx3x3ECZweZI8qrFwHhPXBF7BPIfq5d6sfzT5PpRuGZAK8wZQEAQFwNAfBBV
         m9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462168; x=1789066968;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nex6/Hy7yvNVnJXvkcKmaAHxT5UgZV76RueF1j+QKlI=;
        b=s+sLT/llNGUt38AxHhPSv7U8AgjP+wywFNcbMZZILJl+WomLPg5vubdAIMfltlhN/Y
         e25s48XnvI5jGdewYpDOGaCOgrFVCM+CN2nnFDroc65iWsdmDCcUoEF87RAlxDZO9poa
         YBdP3Czi49TKp+g+EBU9ltcs5sPKXH7hPy94tZYuPVPF2GCZtu4T8w0tfzFEK8ZoeGO/
         cLvJZaWPs/x7cAsgwvknIIv6KQirbbWg3cYHWI0XQ7maMzt2K6xl+yHP+t+ItrZjvFER
         9QZSAqYsvsPxdHPflTASGyzuKLElWhNv6LzjuxXAYLahiFfjxRn++y5pDotPopaKxXBK
         pGZw==
X-Gm-Message-State: AFuF++mRDYhQK8+ADkxcpmAncTFTRCkfv9CZSPCM7gT0fYWhj6tETe40
	Gchc5QGGhay6HaX59H32quvAhTAhPjz0XAomfMmrtGBYbiuPYwGeP3NR0E/cW96SPTwhkORxFHm
	XCKI7SobXhQ6n7nuNP1UpG0fUTkdTqXVR1CeAhET4gZTQngonuBIPWOCaq4miw8v4nJ8XFj42
X-Gm-Gg: AYBFou0dbZEykGR05ijFZIGTYPNDP2mkZyu0nAl4GaIsSQfSpv1yDCDRTdpUX19Kjsv
	Nm3zl9SHxLS1Ycv35mF11lm6vjuvi/GoqtmnsfU9tUxPCkpi13P00YyBdHFMxbYvZCZBfmJDbrC
	hvEitiZSvK0qNVNlQYPWxujwbo5l4SevzLl2XFBCE1BRHg9e6Nj3ZDVwcVsbzCoQRNg9WOISV3J
	dr2mJrsF9Vh7ciiFats8L2BWt5+tLc/064GNMaleylTfynrD79mn5gyQvgm4bSHzvpektYjNGaP
	o2uexQ182QSFQ26u9DTDs//OI9ZkwAJFI4R202zYsfQ3U6Woge8Ft0cjUVWIXOVE0UkbYPsUaFF
	XoEt3OgIq8VeGN1yF/lJw6qY3A6OIefH0SEAyzrC5f1FCqeAZjf5n75I=
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39b260dd3efmr1009288a91.1.1788462168230;
        Thu, 03 Sep 2026 12:02:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39b260dd3efmr1009142a91.1.1788462167598;
        Thu, 03 Sep 2026 12:02:47 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
In-Reply-To: <20260810-mailmap-v1-1-76b680fd0dd4@oss.qualcomm.com>
References: <20260810-mailmap-v1-1-76b680fd0dd4@oss.qualcomm.com>
Subject: Re: [PATCH] mailmap: add entries for Manish Dharanenthiran
Message-Id: <178846216570.824911.10535583032195620580.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:45 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: z8F06ehz_w8ihXHkHMlV9d69IMkKMQX9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXzBEw+IxIomrf
 G6bkelb5lD4dmGE2sMgz8NkyAa4YO601SNYzyLEoW9tnjenmu/5ClOJGFk6X+WgMajQTBCWLhEl
 MHIJCUN9QCEVrRB9AvGjF4aLKzkZWwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX60SzI4RLuRe6
 kI18dEHd/K4q9TVaSeUMDuyHMOkUV2MR/BO3Y1lQdndO/khD87M4V7UlwDEL2d70nmYSAHqfLhF
 4EUsn+0SupwLqEFqNjJ8lgYpQSGbCKc0H78ALnL4TwpI/Lsgeh8JZ8tBAsQRgD1xf2TsORMq+hw
 Kwf/embauEbuVGE/Jq5Lyo0pToTKwCeqOefDde/cIU83UEWhqfO7OuCeceZvo2er/OKJhP2WebW
 8q46cFbalH7XULRjRFyOgIuWmxh56gxYlzifdPGVA4JFRt53wI+f1bouED8CUzS5h0lRkkM0OyW
 7bhAapxaR6xi94GWEh/eH3sxGwRYk9W33MeDZd44BrG/FVi4Gl/rr5t7VVkHxA0TBwoShkVC9Gq
 l544UcW8mFy1NL8xmISiDips8h4HtCFMP1EsH5DPAROVwCCfCdwLksOIWdMFNlww6TjUZA6oOmF
 wjOROSbgXnvh6EtISkw==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a99c458 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: z8F06ehz_w8ihXHkHMlV9d69IMkKMQX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120249_398024_8B2BAD7C 
X-CRM114-Status: UNSURE (   8.10  )
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


On Mon, 10 Aug 2026 22:36:09 +0530, Manish Dharanenthiran wrote:
> Map past iterations of my e-mail addresses to the current one.
> 
> 

Applied, thanks!

[1/1] mailmap: add entries for Manish Dharanenthiran
      commit: 4b8e9bccbe08ce5961540e6c63fac326c31c35bf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



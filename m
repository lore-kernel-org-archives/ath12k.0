Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301E4C3ABDD
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dz0N8OJiFEnN3TXI/UlAKcDSuvFXRmS2jiRZoeBQsc=; b=D2yhH8AjFU8nXiHMAiH4R2iSlH
	p5u5PnumZx107fxRhj2/McsBh81xI2qLxfx6MChSWfZVKzv9CKgvr9R+W7IY/wgzqUtybLIR/qXLB
	tNwEmKOK9buW6ZM8bHiZ2LISFDVojB4JOjDiXSxvre77ibSYgmuonxWez5O8hbaTuLgIoN8LEPqG2
	vUzMHdoX1BHdCTqe+Hz+uzBSIlFUEBu8q9dfqr0qmJIVFN+AKJgjLZ/fSscdfw4z/pK7dbtmrbw9K
	A1iSfF1/D8zkSaKANmdI9Fh9ZnrZ4PjXQAsA3r7ifsxKtX6K/QIZyc0AQMDWEbMVHE6uWWC0Yjc1q
	Bnr04XBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56c-0000000A7lV-3s0I;
	Mon, 19 May 2025 18:20:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4b1-0000000A0xN-0bta
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JHSo72002845
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dz0N8OJiFEnN3TXI/UlAKcDSuvFXRmS2jiRZoeBQsc=; b=jXS7LIQsr0VdQtv5
	jfEhw919kwTiW3pLjwkB1xXMuYUs0jEtlQCKAdsuiEMbSXA2XdOKWYB1X57jtrU7
	ySkjsgrNXoXQqD5+sBviUtIJXAv1tPuZ61SNLCXMNRtyfioIAvHXVuF93AVykhDs
	5brRGrf+jqLIMRZVJJknx1SOoEun90yO/GmHQTMBEfSNZ5qyTjF8WUYbDYtMGs9c
	jTUI+pNTuukX5fimufmXUc0fLhutjLLAXD3ORJ2Q5kUCouY8fMlIqiCC/2zCGfTU
	V6/nU8KfIq60psdkyS7wiA04fQ9U8BDToFTEUvAcZZ06AfrAUp8Xx8+sBkZnF3S4
	VZv0kQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1athgqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso3045835a12.0
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676893; x=1748281693;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dz0N8OJiFEnN3TXI/UlAKcDSuvFXRmS2jiRZoeBQsc=;
        b=gDX5pSRKhADq1P6JA3s3wVYbAMdcHEkEsZeGawaoAUmDM5/QzIquYpEv7As7fOzpN/
         tfEFpzWw53zL7OVbHII5ghHoRtxyCQZdSoaMy911mE+J2DtsvE1+8PYuy1mJoDJKCbAm
         FxKj0eMOIZ8xwiq0QWaTLrR+GlKU3dDCIhl7d/4OMfkAH5Ba/jRqiIqXzVzadJfx46/I
         IlL3vH7qGYYgJopfh563bpO1Dv+A/QW5NULPh6YrmHzpkE+vtMjexu8uDoCYr+OEvTUq
         uY2/ssRF+Lc8dXPYelqtJcrISu682I1vL4Rbh+T8xQmKTkEg44vSurplc4dhAkdCLmq7
         u5zQ==
X-Gm-Message-State: AOJu0YyZRQbWoWsamq743u9Yukh8hFKeRcAjU98e5kd4/SZDRIEYqU84
	nyQgyWtQywa5mc4m8yV7cOEEK1F8Xifft9KYO7X30Pa02m9ye7MWd6w5WrLJvW6h29ahP0ayeyp
	mdPMM1RpD6gObqLMmQfiwOGA5EvQ7vjcOJH9y4ezROWNYkri6Uk9rnhLPV9+F+QVL
X-Gm-Gg: ASbGncsMCV/QF0nS4V0zkTFQYHSglyzOesr05G9p8yzukv5j45F92ZxeySHNTTYcOSD
	MrfAEHR7ZaPstmvHJZyo4I54zlFFY81qsn3rqkO3X4V/8RVdflKWw2ROzYW8xWCeN1s3AShqcYj
	Bw34bl1rA0RNt9XsC+23VkI4459+QI8A8oZQ6Z5CSj7GTpuJOh8gA7K25sM9AHIqmrmBFuwDy0n
	IrfyB24g7S1xmMSW/KoUToa8gIOHcrHMOzKTx4SQbNkE4PdpKERW5scYkr9Ni4qdz+7l3VpShzB
	SjYoVRgfRKrVV0+sb6G14ZSOftYPyn4fV0uKuy4Ux9nQn4Pl
X-Received: by 2002:a17:902:e54e:b0:224:2175:b0cd with SMTP id d9443c01a7336-231de31b382mr174721885ad.26.1747676893055;
        Mon, 19 May 2025 10:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC6Mpowamzp+QxaCqDYjIUpxCyCKIrN9vFMzM6IHGdfyj2qCxwrETMdoWifD1OzFmgcE+Yig==
X-Received: by 2002:a17:902:e54e:b0:224:2175:b0cd with SMTP id d9443c01a7336-231de31b382mr174721675ad.26.1747676892667;
        Mon, 19 May 2025 10:48:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Vignesh C <quic_vignc@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250512065849.2833232-1-quic_vignc@quicinc.com>
References: <20250512065849.2833232-1-quic_vignc@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix scan initiation failure
 handling
Message-Id: <174767689195.2567051.16233007909568567148.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:11 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b6ede cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=sXF4B24Cz5WW0EW5pLQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -hcSC3E9uqaFpNb7cRWvsX31ZHDbb0h_
X-Proofpoint-GUID: -hcSC3E9uqaFpNb7cRWvsX31ZHDbb0h_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX0oigZAZ2ixrY
 nfO39V+EW8hicCk9wLAA4yqoSvroAIgkNVsoJYTJ1+r0znJgrTC4JfC5Uq7B2mtSgE7fLEe6/Xw
 Wwhu3FZVo7AoVFc+f5aI9hBnDO7Hi2goHACe2NMSO3aPv1t0FDRGmQwkMFxX5gtnbv2/TPcqqjj
 aAU8OR3EbafiWLSH4yiGujBplnoxj4BxNRO2wPXs3rQOTXZGV/80y2UbDAXl+OySTT2MawafoWL
 +3D7CsRNO17afezTotudhwpsckZ+WOYFqxNCwtLh09VBjmWP/xVH8Rd8lA9bEoiyF7Oo9fNTugh
 jYTANDZ5d3S19d/6ETPFMeKX7uh2wsdRdQKCurm/grzKvu/HI1Ozjm0iiQzzlz2cFM5+wHvN5SN
 AgI3mkvK0rUYwZWS1uJZcm5U080vo+28K4CguToDjdy+k9ZjJ3n5/YWPNgbV9L70DEvSj3RG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=971
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104815_307737_1394FCF7 
X-CRM114-Status: UNSURE (   9.96  )
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


On Mon, 12 May 2025 12:28:49 +0530, Vignesh C wrote:
> During a code review, it is observed that in the scenario
> where scan initiation fails, the current code schedules the
> ar->scan.timeout workqueue which is not necessary.
> 
> In the scan initiation failure scenario, exit the code instead
> of scheduling the ar->scan.timeout workqueue.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix scan initiation failure handling
      commit: 241dfac96279ce9de47a6d4478dd3d41f262835f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



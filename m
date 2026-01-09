Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19E8D26D67
	for <ath12k@archiver.kernel.org>; Fri,  9 Jan 2026 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODQQxUBDpSSDgzBzbSVqkcIEt6G9NnCCFOxruI1fiGg=; b=G+HaUnxJS6+FVl6+UJ1NtsJJBA
	BGv1loTZPRRkGlsFA3LJRmtBznO9E8sgMTsTZDZU2MqvYnYBFmT+t0rtYC2GvX9Pdv1Vbi1PgpK3I
	fSTngfCafhOlioFuxyuL7Lr/hfyV+V2idQ9RSQRnLCu3ayyTwhCUQr65W4Z4SSsIeNz/YZnjPABEE
	Eg8tDCGzhEDjl9vDlzy32O4UKErNPij3T27ZAAHaqbFPfS/BQZAN1oT3zNvdlhbVaqLm0MtF40IZz
	j9QTrDkFcISn85bTJG0VhIp52tCIRJ4uPXVqSGFyTg0gRbS2IV58H86LTWaHcUjchXA9srRcAL7Iw
	+K8g7pmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEg1-00000002WX5-2lVB;
	Fri, 09 Jan 2026 15:45:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEfy-00000002WWD-4A2G
	for ath12k@lists.infradead.org;
	Fri, 09 Jan 2026 15:45:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XQiq822858
	for <ath12k@lists.infradead.org>; Fri, 9 Jan 2026 15:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODQQxUBDpSSDgzBzbSVqkcIEt6G9NnCCFOxruI1fiGg=; b=NAbJAxGvQwDZ/q2P
	5JzMrRFta+br5cDLTu/9D8n5IxGxRQwYDIfhtkDuyft0UJpD8p9FwrpvGihax7Qs
	jGiSG5qz7Uft9VXtBcx+9cIYiI1zV7qcesr2D3QZ6Qf/ZbjDWa9AzhNt9CrP8eTV
	3FEXgGbNn6Lor9lzJfzoUjot9svR2N+mzNCqikymTRf45Z5g55pykAqVfhB/MUZ9
	gevF7Szmlz3V8b13NaUli7YppqIHp3Tsqb3AV884koR4GINrHjZiuwWOs8d/HrbS
	spGWSAiwdN7Mig9UmAYpIYWNxGpiIHPwBbmCTg9igfkJshg2RixalI/BGnKTTA1O
	eSLmJw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94h8uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Jan 2026 15:45:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ac363a9465so3490527eec.0
        for <ath12k@lists.infradead.org>; Fri, 09 Jan 2026 07:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767973521; x=1768578321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODQQxUBDpSSDgzBzbSVqkcIEt6G9NnCCFOxruI1fiGg=;
        b=eBA6IQfZ3f58c+QM/KrsCne1vaSDTsp7mDo1Df4cE3q/scau2BPp+mPaUA6uo85lXs
         lc/XG024K27mbULf71CqK6XN7Pkf0EvVJTVv/U8whivsv9XDnQBb4jQf6qqYoJlzt8IL
         VNBYiyE8GAYwkP1FY7hoVQpdiqwAsq/VO59gOfYLR6eNw1VFEBJEnQupDHOnVT20j/Y1
         WwAYuW4S+K53P9qtC9RRKlI8c1zKAtnJUe8snKfYH6xkI7LEQ+Z2f4TGC+XTQn+3DW4x
         GF8V2mfhaVaKYtw50vpMbLhjZTo7OC+BnEOpTRhH+/UaCrcBKgaX1gu5YDX0paqZrFKc
         GiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973521; x=1768578321;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODQQxUBDpSSDgzBzbSVqkcIEt6G9NnCCFOxruI1fiGg=;
        b=QyUmV0yvfBrUM4MU8pVaz9GREJJRjV/vfyVM69zW35Sz65xXY1kw8E9VZrFOAuvzVB
         w8c9juChh13g8C8+o1Go4T5NKMEuWi6l20pMVqe94I4lSY4MKP00WowahMfx89yVVVEW
         HplQMK4Ny/u82j+Wz70RIq8ZzMooanJ6i4+TpGW7ySbAi+BfnMPg25rTJqIhnwd4UQYm
         WUalBUoB9Y/yzobRfe4/e5F/wTZiFvPMIMjlZDXlVTfcFi71zNQ9cRLS2b3EtIeWIYeV
         3+qT8IfrFzNcODuNC/35aRrPL4/n+FA7camrlOxa27N49bafTdb0AB3Zjefq5uQ9pY9X
         oIDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk+g09g4gGYSsU7xqBKLBI+OA1o97TXWKZDU2EuUjjmeilUZ5YLG3Tr198cdjGkNajvISI9/I=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjr5hEUolNyqH0Tm/oQ4+NQE7+NpQsKxCg7rbLpuXQYsE3nCvf
	eka2T5ynEAJCAwe34vSoBBSmRhryVML/fFcLqL/oDun2c/SeuXN+54tNCviFf1pLKeeS6ixnads
	yrO9fubU9HNlFtDAk3LHXSNq4BJvEhN1L9Mj72jawu7vpCpd2zvyzJGVkp1gH/EhHu96uD5sL
X-Gm-Gg: AY/fxX5QYp0qpKdY/1xtL98eGBZBbQwgE1nOvNaOj/0hM67Gjp98nZMv6ViSYoHz5Rw
	spEYOSJSkNTa4ujhqNHqWkNLt5+E0m9886u5eHTb+UTKkxpj2NU36J0XK4zlvYg/JJDUWpldMs+
	DFQCxjxUKA5jxU6r2HTzl2YDowXVJgZ4i1ZWUFX/NaZwfqCi10zdGG+o+GKrZTMhKD8nXGXKPfC
	xxiHhWPXiy0WQqc/ud7v7727wQLsi3hV3rqKuGYa/pL5IGba7TsMfwYmHmo4K68pxiuz4jRoyTm
	dCTOSp88shq0jHp4sdVXh54Hu2m99XgLMufLzEtt5M+zVdDWa2YT+96HRcj7uQF/SU/YmYu+NNy
	EHPDJeiRCS7ahn3o17UcF4b+NdT5cgpQS0Vcqxyci0LQ2EkPoQiRI9jPMubDtfMOK
X-Received: by 2002:a05:7300:8290:b0:2ae:598e:abe5 with SMTP id 5a478bee46e88-2b17d321a6dmr5550958eec.35.1767973521395;
        Fri, 09 Jan 2026 07:45:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzeEmToM+pLvDD8pk/75vshZI3WatO3trU2XnbBkHWqxZ/l7rfFBwfToAGPYoY73ncIV7pYw==
X-Received: by 2002:a05:7300:8290:b0:2ae:598e:abe5 with SMTP id 5a478bee46e88-2b17d321a6dmr5550940eec.35.1767973520863;
        Fri, 09 Jan 2026 07:45:20 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd8fsm13212585eec.20.2026.01.09.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:45:20 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260106084905.18622-2-fourier.thomas@gmail.com>
References: <20260106084905.18622-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH net] wifi: ath12k: fix dma_free_coherent() pointer
Message-Id: <176797352034.2503774.14369689269983981548.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 07:45:20 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=69612292 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 3klooZc0zyokXN9SzTN5qvB-68mYsDom
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOCBTYWx0ZWRfX/xw76Q7W0gf5
 hIscvkfnm9lwqImVygM86qPQbK4haipjoT3eWghT62MKK2ivxNxBoMUjRbnbn9gTrdFah+mmY0i
 b7Jv0TVE1Lm4hUHmBhkyYy2ljP7ZkFEZe4sRy0s20ywuED8QY78R2K8MaxK4Gj/oWN81q43ti73
 Sk6a/BE7Ug4bnjXgZliLwqQfHtNnFxLaYf+4iJTuBa1oNOc0aLuighEJkUUpuEyeOaRYf1mOKo/
 2eew0mu1emp+OcKMbqpkp0U+MpxgeB2LcI+1A+oZYgBCYlG4jWue7l46zQm4RdEhcGymmNpuHHk
 EJPjJbQHAL/jOYY9u7yUlOnHOotmYpDnz7cVIIq8+Nf/BSy53fQvxpwAbADi1jU6F60HOyLgeeI
 r/y7SUXqKcT5x5aBaQ5ouJ99aPZUQNidbsJrlJBQcBlx4amZwN6ov4pd2gHo1CNvJ4ajHO5C4jJ
 drT44hL88Rl+GXqkBgA==
X-Proofpoint-ORIG-GUID: 3klooZc0zyokXN9SzTN5qvB-68mYsDom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_074523_035829_A67271EC 
X-CRM114-Status: UNSURE (   8.23  )
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


On Tue, 06 Jan 2026 09:49:04 +0100, Thomas Fourier wrote:
> dma_alloc_coherent() allocates a DMA mapped buffer and stores the
> addresses in XXX_unaligned fields.  Those should be reused when freeing
> the buffer rather than the aligned addresses.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: fix dma_free_coherent() pointer
      commit: bb97131fbf9b708dd9616ac2bdc793ad102b5c48

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



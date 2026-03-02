Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A1EB3637
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/mCon4jzur60YjChtELCL4HVeOYE7rhKXM0jGJ3T4w=; b=frcEroUnBZ9RYpDeb4U+jSer1C
	ywTzlseOqnrGB6UjYRXfcJAP4rzsN3sS/MabpaX6fMgP9QM520vmNzKziRU0oVKkaA7IN9RW/6+c4
	gvFRPCLWaOnpzE/FSDAgN18FekqyZn6hjlhcIhQyPBW8j5dGMpL9tfYSQYuptOEERh/KTVxBF+hXf
	lssKBih3P6fyGnXO/z3uBiXojGV/QH162Sj6+TfbZ3kjaHCcSSwYnHcOLCHL1wZl4jNIFTKx4Wezq
	naSt+4s3bL1DP+q7eWquyLecL0FX39ufSIrmpA7FwSCuMpYeUSKpCxMCFMJptrpjkd6VX917RQO7O
	GZ1AQiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUR-0000000DzwK-0l6x;
	Mon, 02 Mar 2026 21:07:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUO-0000000Dzul-3d0N
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 21:07:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622KHVhi2504662
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 21:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/mCon4jzur60YjChtELCL4HVeOYE7rhKXM0jGJ3T4w=; b=j5tpmuxIqKYV45ph
	tn1KDWEksrVsXouBge6tjcU1QLBaKnVLr/mUQ22mP+pEWEsNm+rFrkEZRK1HgB7a
	FilkmSBI+BjMG5a6Pyk1famhiR/5C5i99VhfQT94d4hVhAtuoaqYW0H9ab30NK4O
	f0rqwYWe03WebW2IDTKvE0dYK8BUvWXbuWKZiWR1FJqkYU2q0ZWigjoUaBVY0QPZ
	Bk1J5kc4LIp7omz0yK6nQucB81ZOGp3XZ8Tda7qLwcEBYim7y5Q2/Zd4jhJ5ND9K
	D62vkBmNCBnq4xDpuch8MDDSO0oGxkJ+AZTAXmuDs6cph9ygCi4Dps/wQB8w9kH+
	9Zw7qQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hety4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 21:07:40 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4cf783c73so82878804a34.3
        for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 13:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772485659; x=1773090459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/mCon4jzur60YjChtELCL4HVeOYE7rhKXM0jGJ3T4w=;
        b=MEkvRJgCQpJlxUuX786W5ub506Mj28tcnAsrnB3lZsT4+5kLEjMtjrxhEoBAHCc1xN
         7eKAG5PXV3XvewCpe7VHktTae7Y2tYv3Y/ifMiC25gUrOsZUhPkKZd/0NZdseU3wJNFK
         xlmZSSiaQAQcf5hlf6PV4hVgDBMH3g0TXLXStTzMvvpo7Nh5AOpgZeSpR26dlmCQAxSd
         BgZ4tlr9zCQUNtWUq9OX/0p/gPv5hAPGjmZ43p1955SJNqBjI399uBFiI5vvjunHjuCR
         CbG8pJkHxlO8ilHt6Nhmdpa1ij+cnZWwAnWHYxBgPNotn9vFqdj0GoXCmhsK69T78d3D
         Fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485659; x=1773090459;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/mCon4jzur60YjChtELCL4HVeOYE7rhKXM0jGJ3T4w=;
        b=VXR/m+OCQG9400tGEXPASFsvcHSgR2uQpjB77Ctc7IqqGA5WLBdHWc9qeSmOU4ztae
         Kj7dLNdP+kcufBk1IivAguNQwBj23W6can0BVMV7DQ2Be6mFDPsDGMAEcimquc2cwS6/
         Fah7PWv0tUumAHbCuSm1y1RP5/3yJbvStbz324cZe4x7YR1Yn58/0fMzd+U2iroc5n9+
         XkklnAJFGQQz/qIubWoFZ+gEQX23V5VoWpVGi2M34YvwMfjJp9nab+xk48OeVQCP/cTg
         D0+jXGgi1OU3q48a/KC/U6t1SERK4mcZr4mp54/oS023sPV3wpUIkgQnW6gQwwER3AeP
         9gig==
X-Gm-Message-State: AOJu0YzzWp7htabxK0qmmjtCMA4cZVFtM5edP2XmFhLFASObTDcX0MYw
	R2GZebUp9gBQd3IBqe6H3QmylzBObLgtF/gBfhODufmtQWnyyv/GJnfhcVCWnr3Je9swYIC+J7l
	q/eoGDZh1eyXpCLYUvEipPWzUgJBbsqYqhmJyld14B6rAIVXnq8D8bp+8hUboEG88hDk4WXmc
X-Gm-Gg: ATEYQzz1j6zE2GjhS9VNKhlGyKM8xqc1yfzt2bcaqE4iJD4g0fFg3uyTxwzKWxb3Ux3
	WxSGGy9HsPPCxTBmGTWKGaShmvKcX7oxChb6HMSpRgweVR4CvYhtdyNbIWqobOyGMEKzXYj2qn5
	0SqE5IjuqnAqz+s0LJRkNpp0lXI3Y03t0A0JIISV5hS0Ai8gtVmBnzX88oz8XUZA04/HhPTkgSB
	qmJZbK7bsIuOvradCVTSv86EvK6TkUt7fGWdHxi4tPmNpiKq4Hu2/y0Lx96QMdFPX5/enej0VDc
	Dub5sz1KGtdWy43HYhk9EE5CroQyBfPOmct0wYWt/oEHfmP7BxW9yMyi1IjFj0olaAncOxxDr76
	WL4TBacxP3IF5/+2yLmQdQVuRi34Jp/oQ/fTWqdWRD+Jgv9mn7ADGnL4pB9NAEGdp3aiJ4/tE2f
	Ww
X-Received: by 2002:a05:6830:12d7:b0:7d1:50c0:1a24 with SMTP id 46e09a7af769-7d591bc1a61mr5655381a34.21.1772485659561;
        Mon, 02 Mar 2026 13:07:39 -0800 (PST)
X-Received: by 2002:a05:6830:12d7:b0:7d1:50c0:1a24 with SMTP id 46e09a7af769-7d591bc1a61mr5655299a34.21.1772485654720;
        Mon, 02 Mar 2026 13:07:34 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5998bc31asm7449967a34.23.2026.03.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:07:33 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
In-Reply-To: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
References: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Set up MLO after SSR
Message-Id: <177248565349.1002715.8137030990862032793.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:07:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5fc1c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hTPEv-E55Fei-ytjfJcA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: 2f6JL_gDjt8tgLUU68e2ALHey9Iwgc_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2MCBTYWx0ZWRfX04P07ValeGlh
 8Pg7ye+f2PMHRxNo5Rw3zAi2TURo1ztC5fuoZk3xJX/9MTejthX4/aa/6Zo0gUSly3o4AT11UU2
 xVcj1MRMmA6YRmVo+ccplU0tBWexMSSlbElfl+W8vmLrn9orA0UaESUsrBYYDbZAHzfdCV2tbbA
 wskft5ilhzfpK0JbylF1BUFI7T8GeU4uizlS4QhJzi/T8WM7F7VCeJoFnvyqYH8WgwMcKqTMq3i
 Xqq6z3Vj22r2agFmiyl6X/KA1Z5iOlBeBHN5zyrRLfzQatuBsXQ+pnFNrc3vHmvpwTMEnq/ik/T
 xA4w1m26S+c9/h1G+9ysZkpPN6nedT22crQPOXjDqoCrn4+L2HoTJymiSgP3XPE6PTRHI1JFQGF
 mhkXtoOy9X8MESVSGjh8XEpIXua5p3/IikFMakMjBjJ2By3NiUhBCNwLCbblBLV42ycWdd4Av+6
 qrH4IMXgGBKgEX1U1og==
X-Proofpoint-ORIG-GUID: 2f6JL_gDjt8tgLUU68e2ALHey9Iwgc_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_130740_943411_3B501EE5 
X-CRM114-Status: UNSURE (   9.20  )
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


On Fri, 27 Feb 2026 09:41:27 +0530, Roopni Devanathan wrote:
> During recovery of an MLO setup from a core reset,
> ATH12K_GROUP_FLAG_REGISTERED is set because ath12k_mac_unregister is not
> called during core reset. So, when an MLO setup is recovering from a core
> reset, ath12k_core_mlo_setup() is skipped. Hence, the firmware will not
> have information about partner links. This makes MLO association fail
> after recovery.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Set up MLO after SSR
      commit: f33a8e41826831fc8ceb5f62833488cd9388ed59

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



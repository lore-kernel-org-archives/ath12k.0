Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30632EB3632
	for <ath12k@archiver.kernel.org>; Mon,  2 Mar 2026 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=No//8h+eGpOLnCSvrZ7A+enHWGNqGIT2SyZYmXYaU6o=; b=QxG5ZP8aEIFQx9OP3OExzLO+Dn
	82Es0P53UYBzaaN4lkYsk+zGF9UiNCbVl60+NB89DMIIlQkLu+xI4SCcPmjbHlOvo0Nw8EjaAQT5d
	PchRGNpvstzQKsExmlXIpq3ajx3q6lCqqwpdj8t+domflsOWlWwjxUrCyWhiQcInqlAOdcPgSzKFJ
	+bvMlL8NEdoJdRk8dpm797CUOrJbrkcM/TRNBKwyP4JBh1Y5SzgvRaHYE3VNw0l1LW7aFlS8mmD1z
	fq+vPrfa1dBjZaT7Cp7pAEgMotIlF+DRAyTrBHIuqXCsU9oIVIwPtbL05I2pBVZKTfDshRG+Cr5dJ
	pTb15L0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUO-0000000Dzun-3mmc;
	Mon, 02 Mar 2026 21:07:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUM-0000000DztZ-3XtT
	for ath12k@lists.infradead.org;
	Mon, 02 Mar 2026 21:07:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622KHVhg2504662
	for <ath12k@lists.infradead.org>; Mon, 2 Mar 2026 21:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	No//8h+eGpOLnCSvrZ7A+enHWGNqGIT2SyZYmXYaU6o=; b=NqjabR6NpY16r1iO
	/+NDpmWkqw1lMIUbfvMYxpeokNz7Jjn4Y6fh2YZkhTFDjG1uqN+fTTaSbA+B6xTG
	tsmJR3x4Pcxea/xM8kP6eDstu0c8cjcbx4poO5/2zjnbpzwxbDq7Or3HgX80QUcW
	h3jhMAj1gTzwYEiqawv00dozu7opdEz/h5cEKWopHRCZSBgSNa5Uzsk46CA8xI4f
	/h8sd1DhFdjBC/nQWBVAQkc6rUO+FLOCx5mkASpNe9Do1lJGQbCKUJBM8IVeKi89
	esl2kdf2vXirJlxA1RaByFNveFhSEQhgKmlbdZ79l50FCb3Fqf3+fbOuMm1AofIZ
	G5ep+w==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hety4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 21:07:38 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d49709f87aso60364201a34.1
        for <ath12k@lists.infradead.org>; Mon, 02 Mar 2026 13:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772485657; x=1773090457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=No//8h+eGpOLnCSvrZ7A+enHWGNqGIT2SyZYmXYaU6o=;
        b=BTllKQo/FVj/CvsP00aXKKWChIZf8FEACsPmgbT9FCdLguAKk4fg94uy6qa0/filMQ
         6iAP85ZhRe0tD+B+br90rweYlLFvxlItic1RuKI8lF4oyVjUxOs9ZdtMm21g2d2MenPj
         Uu2b2zMcAdBqSMcZeei4ShNyJ9X9McpTNJJ2lY9PPL6bnmo55x7hsC+SluletQ02AXeg
         eVLL2dUyKMAQAvGGZmBrSroSfiA+FaU7IJwA0j9GcL+Ms4rwGxC+BrNhgTpPuOl3cn7X
         5JnoJ6Laoav+E0ZotEINuInY0TRSn8IE33WovRStaIytXB97XRGIzZz9AaLnZ6+9E3Oq
         kUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485657; x=1773090457;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=No//8h+eGpOLnCSvrZ7A+enHWGNqGIT2SyZYmXYaU6o=;
        b=WFYc8G+wfvS/HjYVwHfBZBjFkQHlh8/NvLWAjtIP0eVLXgIRQwY0Ha1nL4RUprjYXg
         FesOP8/vlwY4fyRE5oyxnrgl7L6EwxnEiA/DCSpVnTfsDSdAbnvIXqDcYRIrRUIYw9wU
         /6qezk8xmfL6qywV4FQgzEA2zTS3zMnikZB5dwd6+s29idg2C0xyM6ZeUc5UYedNpEnc
         YPqNypDCFKitJIa8VHRbKp3UwMgpXixL9iSwiDv/O9atkedwFf27gmq12Yx0PvK/Mld8
         PMtoFDTImbI9RSJ3APT3qoh7v3W3N4VquVIms1011RiKHFJvIOuTCNvCFBT7YrTOLJIK
         TdnA==
X-Gm-Message-State: AOJu0YwcmltnYaauaVVfRGrHrW2n7kVkoJcdrpeehJpMa7KJ+ydplTaS
	p3Mf6B4IrDJvzOBG4W3lfHzVwVe05mhClgZlww0h1g01lLPV5klUVusUrReCVnrwjVNR5Q/2wuC
	Cr6GPcIyKEk5ls8xWUT02R07IAV2mfgZvFQdD6Nx9FVCIJKdloOloFSlgKlAvdDLj+RQrwflX
X-Gm-Gg: ATEYQzzH+66utLtLbwWMuhzWpCYgALkSg/wdVB8GEQUI3VCPI0rQHJ3U9Ts1yyT++Dv
	adM3MDvu8AkTeZX9HcKIQp8SvKOx8YdnRm9uhfgGAKSUp9H+Pnm8lo9ptMr98Lmiug7sZZ9/SnN
	kFZ00FRvLtTwNXmQ17biF3eP0h/16CzrmTQzwxyE0qbZzx/W2qNcxYB7XeeWPVZxQ+PnvJa9e00
	crV0fklikxmZkArNKvoKHnbfXb5v6b/7NEzAgqkQuf37PSlPvDfQbWF0WRjj7k0q7QcX3aKVvCF
	J5gCK4kNlHHBTYN8ykRptOv3BDoDgBc/anprDfSacUtOr52gOEUgpjgNagTD+IEYQI7M+wISLuk
	Mzt0ssA/tkn2PFkKVpBewpidf+UWOGeByiQUcs0+RcA11cVtitf3x07w/YhyA5yQX2siCU3KLpJ
	1P
X-Received: by 2002:a05:6830:6303:b0:7cf:d213:7ecf with SMTP id 46e09a7af769-7d591c34977mr10612978a34.32.1772485657289;
        Mon, 02 Mar 2026 13:07:37 -0800 (PST)
X-Received: by 2002:a05:6830:6303:b0:7cf:d213:7ecf with SMTP id 46e09a7af769-7d591c34977mr10612963a34.32.1772485656877;
        Mon, 02 Mar 2026 13:07:36 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5998bc31asm7449967a34.23.2026.03.02.13.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:07:36 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
References: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove the unused argument from
 the Rx data path
Message-Id: <177248565575.1002715.17420870053649610191.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:07:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5fc1a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LVef6NQiuxLdmPMVh7EA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: UZI_hhiXuHiNJ4AO7x9H63WJnYdE_IIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2MCBTYWx0ZWRfX0BFCmddxg2Zw
 ow07lqOYJGjIuddLhcLIp7Be/mJ5uN6qqKTi8nLQKC2SNn4zSiOOYoqGO8Z9/K/pTliJ6wdS/IE
 dxHlgmWIeMPeN9UPNVeK7JkKBJhioLlUMTSLvnjZNg5OA0jiu8k1ps4zfK23bcjyiuXno8k6oZo
 wEW+xR/giKSBm2B4RUz9O7mN180fqJgCzVykMgXgvCLgJSH0HzyOcyalyzwnrCy/FX6jay5gT9F
 I1L33Q3MMOtVkn5qJSuPSl5cwSmG8VfcARHnTAXPpdZBXgE3g8HARn1XK/Ww5Zjbnfn1x+tNzqA
 mhKbJSNkS1v9u5BsVbvPNEZ1imssy3TeWU0eFFoxN/hwoV9fzrNiwQHFickY81x596nXiCgIU8n
 EHNszMaNLy98dGnePZEU8Vr6CBfOskH0oyqmpqwbAZ6Xf9TAQmP+ETgacNdEeSfOhidrbaRbcp6
 hQrhWf/rqdQXuigl0XA==
X-Proofpoint-ORIG-GUID: UZI_hhiXuHiNJ4AO7x9H63WJnYdE_IIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_130738_889902_293394E7 
X-CRM114-Status: UNSURE (   9.47  )
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


On Fri, 27 Feb 2026 09:51:28 +0530, Karthikeyan Periyasamy wrote:
> Currently, the Rx path uses new infrastructure to extract the required HAL
> parameters. Consequently, the HAL Rx descriptor argument is no longer
> needed in the following helper functions. Remove the unused argument from
> the following helper functions.
> 
> ath12k_dp_rx_h_undecap()
> ath12k_dp_rx_check_nwifi_hdr_len_valid()
> ath12k_wifi7_dp_rx_h_mpdu()
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Remove the unused argument from the Rx data path
      commit: cf7cbf97c630c3414302945617b8ac405e2b0dd7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



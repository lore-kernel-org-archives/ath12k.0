Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABAACD6E65
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmCco955bc17kWMyGDeYhFYeOOTUsIA2WBLdaUViSe8=; b=ySYHsFCeZiiO/tEz3zVW2W/zvn
	hWSOtRqojvt05B8AJU5H0EnDWRPkgWF1smaYSxlWCMQbm0i/2fWyWWKqiOEdK4FneV5TGCfdXCnhZ
	YOmSBVqbD+lHCpXU5mSRPi6LApY75fP23qTG8/uOOtAY8FwaEDhkw2NTGvNm5CnVmD8lp6fv4CFJX
	tSuItfsRk7F4LsZtiQ4Lzjg3u7hWCh4FdVtFJqIdULoWYpL92cgbCLhD00NnnCG49GqB3zD3dbFLl
	O1hbLCIJHHzqHZuod7tFz+90p/EIYovagTohKOAozcW6/ZW2XaDJCQ2n4kTpO2k39r8HnhCb0En2k
	1PjQnk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60N-0000000BX9x-3KAe;
	Mon, 01 Jun 2026 17:00:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60L-0000000BX4u-0AIu
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651CcW4i600489
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmCco955bc17kWMyGDeYhFYeOOTUsIA2WBLdaUViSe8=; b=Nfnqer63y5lByocI
	jQIWypkzL87M4b7co8UyPzeQmZvJa5WyMaeDWhnvm0SoPZfjgIQHhDKP5EmIsl10
	vB+lgBuIMRmsHL6HjmyBZI+IIrsRrFzPy4b65xXTH97FfeU9QnxkgkrVi5PIThWw
	FFHS3ZSqDWuZm19V9li9fBCM+kVfpOsW6xpOhBqMj6T04eUOOUHl8SHZYybEyUiL
	Vwzf/CrddxSkGcnvY71RhBNNLBmCFJaW3zLymQMdStJyp4xGpoBi2ZHeu8VZ9jh+
	n97SqxDxH2eHFSka1jPOpAflx/GDcT4xUMvRhawBgMUrFc6NWoT14NMobjdzMsCk
	zXJxjA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r956c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137ea73393cso2213529c88.0
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333243; x=1780938043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmCco955bc17kWMyGDeYhFYeOOTUsIA2WBLdaUViSe8=;
        b=OYRKUMJ41w8QyBlb3oU08n5BsRiS/xKJejV846pem789zWQJK7Mt4VORbBVExAxdtG
         WlMUztWoEmzinCg9+w642cnVY//r/p+HPEF/VPDW+0tOblwRiJCs51PctZF1h3LwTAJp
         V6S6rIgBYElAKK7L3wQOlkzEldZbkfRRrM3MvCmEw1Hcd7exV5Nm3MOU6PGoY69MfELL
         RmhJDU96qrD4npK4yzHeo1KS9o/dQq2Hcv/67M3SWevtRdujP42+NXV6MuGKOgAWyq3S
         Gee/j6afMDmNFk+9j5GqtQrYv8Z4zHrUT1METzuT7cLVNb9O0FA21N7siUuHHz6eqPR0
         BPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333243; x=1780938043;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmCco955bc17kWMyGDeYhFYeOOTUsIA2WBLdaUViSe8=;
        b=mQyZwWpVZSrtRYNeaPR1besFcBM02Cuz0K44Z6WjJniOjkQ25A4jpilyrN5ben8OgU
         5qmlLMXUQWVzbe3K0Dvdc1TV34XkNc94XXIM9prw5lVUWjrj9S0UcZJubaIYwFH9e5BE
         3VZZx5aO0diUhs9p0SIr0QZ12/0Jgpb01R341NwTtTGdsYiE+zGInEJwmP3O8DHUNyeT
         uivyzETaDEBu6UY45r2wUkgf1teCURltQySM+Gg44qlW91i3KDcxuYd+ixIUZNYEXDgJ
         FQmAJTDGGq09T7u/+5ZUy1+pie0YITfIHvSiMcFC/+7Vh/XBr/X3qribx9muvfbuuZ+A
         /iAQ==
X-Gm-Message-State: AOJu0YxrAmQE8TyhFEnrlR5wbse+GLjP++XbNa3PiRAczjXOKfJNsH6d
	MH7krV8sWQa19HBobiMtdFP1weD9i4cZR6o2A+qR1M550CEqDegf1JeV5gvRvbf+a9WPGbDupKR
	EAUC8DUMgUB9ebkMSOrKT1Sf58Qe6FFVAgVoZsZTp9YlQqFOWMMVK+/26ZBcWE5A7
X-Gm-Gg: Acq92OEDjuW79VzL+/UBtGCuaqfHLsUm3iOp1JkY/TvAvVbgWNg5m2AR3nTAEAue7hP
	b8175bAqvMS9D7/5cryPvYVHgXYtqyprnsJ+rK5XJYj2cU9MVEZSXoKzY2NKl0IiDDTubFMjtBl
	AJll1Lge/BEkBykqfFWfjAqF53HisxnZYKv4l4Dv4kxGZeZZ27FTXLaUwCZui8BCpY3y8NFGFDm
	xTHY3riZvM68f/ql/ASme0Yg7DaFk8L3W4CFt2r1OGqDzEM7QELTrqizXy5bhZ3l8sDMjEODR8T
	OSKYiTctZ2QMaQnZtt32tR4kUZVVZ000xunSz/2kY2ta6PKuOPWciaOVRraY19i++vYQaXEhpo9
	64k3YmJOy/SqTCi+fSzrkp8iFiAGi7VKQXak6W3Y6zVPEWaTYQw/XIz0F2xlR9cfkt6U+Walnpi
	b+LYSf5FMK42c=
X-Received: by 2002:a05:7022:619f:b0:137:6781:7dd7 with SMTP id a92af1059eb24-137d4271679mr4471370c88.20.1780333243022;
        Mon, 01 Jun 2026 10:00:43 -0700 (PDT)
X-Received: by 2002:a05:7022:619f:b0:137:6781:7dd7 with SMTP id a92af1059eb24-137d4271679mr4471247c88.20.1780333240458;
        Mon, 01 Jun 2026 10:00:40 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:39 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
References: <20260525110942.2890212-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: Add driver support for WDS
 mode
Message-Id: <178033323970.2045173.3868733357693878077.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1dbabc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F5F8lLM9lksX-Kl9fnkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 41DFgm1gDqz2fv6wJzq7WaF8ABt_jjJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfX5jj7BK/dhvaF
 qSRkWusKzA4++jYcqXRc4HXz3W8IDvH/mOn6X4mUS8CgLxKGSD/MQajGdUbw006jUjKGH9T4G9z
 H4iT6uwZ967ip6mK4rwfWszJVlTu3D63TSzqGg4r4S7/0XnzA26nLqMhf3qlNWtF1dYz9OseZMg
 UhIWc5Rzw2h8qRQtR4PIG2IM56aLJdT0nDuRd1xAfy5gBSoUxpXAWHZvipGWLJkOMrr9E98Ggcf
 lv0rOleLF8vtG0ClOU28NOvzZaYOzBMdvY3zAZtUhFA5wBqxgWVsT3N/31Y/5qd88ZE1WCibs/S
 w0eMg8oTIKLGLYA/G5kS0WGirN5GaQuH1xws2+2m5qPUmhfgu1HYieDOawhrm41Tqzqi/Vc6l4F
 FLE2TCYove3+Zb42cY9wBmGH4fRyTxTRuSXxGoUQgQUC8eho3cVtb2kSx62akGWDu9DvLvWC/l+
 +rKkNgy4G6NI1CT6xiQ==
X-Proofpoint-ORIG-GUID: 41DFgm1gDqz2fv6wJzq7WaF8ABt_jjJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100045_213599_14978B70 
X-CRM114-Status: GOOD (  11.33  )
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


On Mon, 25 May 2026 16:39:36 +0530, Tamizh Chelvam Raja wrote:
> This patch series introduces support for WDS in the driver by adding
> below changes
> 
> Handling of 4-address frame formats required for WDS operation.
> Proper setting of peer 4-address WMI param to ensure correct transmission
> and reception of multicast and unicast frames in WDS mode.
> Conversion of eth offload Rx frame to 802.11 frame for mac80211 to
> detect 4address frame and initiate AP_VLAN creation.
> 
> [...]

Applied, thanks!

[1/6] wifi: ath12k: Set WDS vdev parameter for 4-address station interface
      commit: e1125b0ab6fdda21dde19f7be631a477d14b684c
[2/6] wifi: ath12k: Add support for 4-address mode
      commit: 2f57f737dbf3005951a045eb9d1daaff0095f6c1
[3/6] wifi: ath12k: Add 4-address mode support for eth offload
      commit: 729cad3c3c9e09ca9900744fe2a02b25e23cdab5
[4/6] wifi: ath12k: Add support for 4-address NULL frame handling
      commit: 6d0572f61539c5d4e2971139e7b501e37b7632d6
[5/6] wifi: ath12k: Add support for 4-address frame notification
      commit: f818260ac66b2971a2a587ea08b171b135a2c1e6
[6/6] wifi: ath12k: Handle 4-address EAPOL frames from WBM error path
      commit: 565257a857690244211d85593b2cd490ce86783a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



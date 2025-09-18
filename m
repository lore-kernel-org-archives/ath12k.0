Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33959CAC597
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1geEf+HG/yfdNqdk1eHzom6MIUc3YrSEMLqGnNrlFVU=; b=f7Czc9TC7wAQPA2apvbnFALWwH
	uyWvPiPZPy6f6YDOoX3gCmL69wjOLcgMquvC74g6r79HZCAxIhpb7RQ6o1MUj8bIEexJR/TeqRz4R
	lpQX96jmUUYJ1PlDScuAWjxt8O36NH8J/YW53Plou6cnFOsTY1RzX07YHwuLu//yEgWyew57ZYXvP
	REn8Bp3BGACB4jupOMV1WFP1qk09Sfn0s2O01RUheBbVJ0xt8i6m+FYog/eUVkuXDan8FDNyzfjTL
	gJnotCSvIcoJB81Ti3GwMXPeGbcJSiKyuHf2xQmIcG5ebBeiD0NKCcdwjzboYawAXZ6UBbi7/zJ7W
	jUDxwCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLZ-00000001Rmy-31pK;
	Thu, 18 Sep 2025 23:47:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLX-00000001RkE-1vDH
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IFKak2007100
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1geEf+HG/yfdNqdk1eHzom6MIUc3YrSEMLqGnNrlFVU=; b=EhKrss1xmzBZjkpi
	SHjR6PEmG8R3d0YHMOXwERkYZ8n+EB7HVkvb13EPOESdw8f3jp6h2ljIuYolrjyQ
	H1SGGNvHGVb+KjIhnd7c8B9QQpVkYUFMlQSkpv6YrcON9qj7Z/yVYoShEwm0l5g5
	5Ol2FPhAGrzP1kP/1BjrpNnJE37joRRmPosjI81sToqkdjchLGLds1p+wW0bqMVk
	8MbZGkXCr6N1Ooe5g0Yt3YdlVos5eE/CDhd7ZoOojnZlC0CArdbxrJ6oFpnLNDGU
	0SVco75iA347EE0uDa1W3vw8jyNH6+qVxrmOKylb3+afT4V+mP2adR/S/XQJNtf9
	CZLeyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebetwfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26776d064e7so17835995ad.2
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239246; x=1758844046;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1geEf+HG/yfdNqdk1eHzom6MIUc3YrSEMLqGnNrlFVU=;
        b=lreEazoi8iai5QQmuSJcc20XxZ5/jMwtHzb6CgH8kfLa/+gtghyUVTtf8L3XIiVD6f
         fckNHOyDKgUStH8v01LEGl8meZPV/MtZs1EM2ySCpQO3Rg5VwhjIT7AHKRxjEw4Brux7
         Lv2gZjw2SSpbkg8kM4mRieJPjk0YPwUFjpatTehe3Glk8Qtdeg98o6EH+ztBqM1RjlIb
         clc6ssEqVrga4pUQhlwu0/2w+ilwPB8bg/WTEFpoXK5RVd8UiLG+v1oJSHEagZCwUmcA
         h7hLzMXxgP7ERtybhhGF1CFk80EqhX54eDDRkxhe1P4smnUz4NmM1/F1wBu4zWBGe4il
         Nwxg==
X-Gm-Message-State: AOJu0YzqtbcUSdmdMTxb4U7PFFtIMwVQL0wcWHdwIbNKHOvAEMKUN+r+
	9sJb2+SIpFkepDASY5Gqx4rMy+7J00c66RoNoOMKyCTOcce28MfdF0EKvvAhyFW0oV/dGclq51k
	TfHO64SdQJlrpa0diyFhZN5ed258CNrMZCoDxt4CaLn5B0CCvKuMLIPKvYi0yY/UMv+se6EkD
X-Gm-Gg: ASbGncuOaSHf68e5XYnCoz+Ms2YiT3spOFoL/l+A95JiBpFqN7PEX6fOHmdPeArlhO6
	InNJbOO0Kb7CDa6FnDuoaTkFMvhxm1zo2SPZrVJwtwEHIecT06QRzUxtrlspQqgP0m9TfzeB9d9
	hBTYVsWZn0BsXVCDA98k9/Hg3oniFRnUK4+7i4uWHXCngbyAhO8riw9455HEVDuyKBUCQxRh1fh
	5bvQdochq8qbNPpSgDpUUphLYYYWFRkvvMLTqyZOtLC3sLXKju+ZjOESZKBR9kOUP4UPMRhYQle
	u56ou8sq+NSFjb1UkgurRnJJiXvhTG3geB9rEHgieiUYVwn3KKZ4lDgERKzQr1N5opLmP2gP5z+
	b
X-Received: by 2002:a17:902:e94e:b0:268:5892:6a2e with SMTP id d9443c01a7336-269ba59b78emr18223925ad.56.1758239245769;
        Thu, 18 Sep 2025 16:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5vBaKdgG6geuc/SzRujQVu1PvHGzrO57HIIICmV6juDdmP0QWIoR32ANS8/D7O6bdfgxu4g==
X-Received: by 2002:a17:902:e94e:b0:268:5892:6a2e with SMTP id d9443c01a7336-269ba59b78emr18223675ad.56.1758239245279;
        Thu, 18 Sep 2025 16:47:25 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:24 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250826105714.1188131-1-quic_rdevanat@quicinc.com>
References: <20250826105714.1188131-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Add support to set per-radio
 RTS threshold
Message-Id: <175823924462.3217488.15602655247503171824.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 2NMIYva2Q0joWCf9rTJipdXhC_z1nqdP
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cc9a0f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TXXe6jiMar1sDwaOI5QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 2NMIYva2Q0joWCf9rTJipdXhC_z1nqdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX9S7YPEFVP8cI
 zPBwd2sHHG/B6sg7wy8caGBNqYRjqe2F3SEHNaPAZjFuxnyCdsXYOexzZl6+2SQOnSIEnriY/zt
 v2XLDdaO5uPF2CtBn4qdXXLZqfqayLMRHeebPRIOdGELQ9EjVVuD13hwlXCo55bCKYOHXP//p47
 o+VAC/y9klHVxGlW/YWzfQH75m0/dKG3d+9Q+bIvpQy95U3Xd+bMX+NSfCh9RjzcGTW/PeCWYjD
 /T1lwqQVFGt1GDhnOzWW1oqabX4diTO+3joRMccpw61MbSkq+DFxgCG6csdKZHSxsAkl92t8qFP
 sIuwwHYryzywKf8JOIe1YygFbHkIQftCqtCAYvloJvyMQLIeWJTvsb4d+NTKRl6oWR19y2fCful
 J3EezB9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164727_516894_B3F1EDA5 
X-CRM114-Status: GOOD (  15.27  )
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


On Tue, 26 Aug 2025 16:27:14 +0530, Roopni Devanathan wrote:
> Currently, command to set RTS threshold makes changes to the threshold of
> all radios in the multi-radio wiphy. But each radio in a multi-radio wiphy
> can have different RTS threshold requirements.
> 
> To support this requirement, use the index of radio for which the RTS
> threshold needs to be changed from mac80211 - radio_idx. Based on the value
> passed, set the RTS threshold value for the corresponding radios. Following
> are the possible values of radio_idx and the corresponding behavior in
> multi-radio wiphys:
>  1. radio_idx is -1: consider RTS threshold as a global parameter, i.e.,
>     make changes to all the radios in a wiphy. If setting RTS threshold
>     fails for any radio, then the previous RTS threshold values of
>     respective radios will be restored.
>  2. radio_idx denotes a specific radio: make changes in RTS threshold to
>     that radio alone.
>  3. radio_idx is any other number: report it as an invalid number.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add support to set per-radio RTS threshold
      commit: 87a67cc357a8d01f244ae04284eac4c41c221e34

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



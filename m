Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FB0C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3HnasqIsSKbikCogHHVowiGs5a/Lkgy7cngUMntdM8=; b=U7GHNiXbStYVOPwQYc1ylaoytb
	pl/5Oh6G7BIREAyVlNq8ZiIUk3uiPZEKKYuRJlgA40mJFCmO0RRYIjmCybDH1xDIKzOPiLr7YWLVZ
	h4jax80xb1/xkSd4EST6bgZW8f+8gfhz5zWUr8UXfwNHtWMR/dFEQl3va1WTRctavqHBAreYtKqI6
	cj/HD1O/eUwNc1K9+E8vY3xjZUbu5yyXq2yy+cigl00XRTmzdHxBbBYgbs6n8zMfhgEiP2mENnNny
	AgG8AWqKeODG5NX9GArVki67c/pNADxNvK4JbG72DXKLgCP+d5pEnbM6cDV3PSvu+BikBbTLp/RpC
	EIZ27HDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyc-00000000Epk-2eFR;
	Tue, 30 Jun 2026 21:26:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyN-00000000Eke-33QB
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDaPI2959908
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3HnasqIsSKbikCogHHVowiGs5a/Lkgy7cngUMntdM8=; b=pGDP04tSwQ25tjUw
	WmzN/P8rIV9LO1diP+lx5nYDOQtq/kW19EHAHzi5mOihsWD6saUnnTYspRzzHxFa
	tDBmkct7Kv3Dku6pu2mYjXWQ0dtOfP3HrZU1KfK21n0GOCNe2Yck+JEBpqvsolLv
	xpajK81y3IT3SKJkMrJhT7mCMTXild9fO93G+RlOw/FH+7NFe2KskpHkKtinh+k5
	b9jXdLyiZ3nriO2vDtZGeyqziMbrYOH0DxjCQjsN3QRYjYR+pOyTSC32vI2ubLol
	kQ7Xz3v+6H9f+qDkY2ESTtV/6UT7UEowpUnm4nM2nEagiMyDE1tYZnVdclOL7BRP
	Id4I8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j91100a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c011c7cb9so14064376eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854786; x=1783459586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3HnasqIsSKbikCogHHVowiGs5a/Lkgy7cngUMntdM8=;
        b=PrmKlMIF1tKDq9Ptr44sKqCLiIbRih1RukYefqml6GcmoYXgH431d8+cf4jCfBuJvZ
         tDopV40eIn4UuPRtlxC/Nb+JkV4DnO9Cgc+G6ewobhZmH8y6AIT17rM/dAk7o1Brclxa
         lBIVpY4SkTOmXyXBAS+7ycpld9iRRtxrSfJCmYmOr0qRJijaHttI84Em0FN7qjHFh2lm
         x1u8/jkFfwJxaoSMDXnRVitzc5eJ05RLNC+Xms9Lo8pW9CPvUWdTzeWovezutKGqc8fX
         zLtLwbVDg7LSZUpG1tE+4lIwHlK8GqGFpd1ywruvzyW8B+c9va6bVJ1kYkweqWB6yHhL
         YoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854786; x=1783459586;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3HnasqIsSKbikCogHHVowiGs5a/Lkgy7cngUMntdM8=;
        b=l/Yhp5SZecZZ8n+IQd8WN0cPlzQt3pCnhW0bQSY0Y4CHl/P6cxON/wjn+3TQf2Ui5Z
         3B6QbKFhRpemCH/dRUM3gk6HOigdgacG1JGAvPB6dgNpb5EKPpZxyJFWAEZYHBOC6TbS
         4KbKR0wd92hPWajzENTegMUMjJIMX8FlqNeP68LujnJGxzT8x7afP92JYwiDFnOW/b7N
         KSMkAJOAkbbXy0YwRwe6lUW9mJxqChGFqKVHV1P7FtuyaZbJ8shqQ8vwWE+3jkLvHkVy
         bVx9UP5UHPs5SUaGH52yNDnXiTzGkQJG9zPMHMvxZrpjjGS+46+aBFJg/vm5fHNc221U
         Pngg==
X-Gm-Message-State: AOJu0YypNcc95IOzGHoj9FADkgcIs/vppmWiIjKROt7EOWlNDUbxdrkT
	ltkLgAcEiL4tjjuFs8WINXl030sAEd3gUyFLEgw6f4XseIqP3lw8eT9ovzud47+RRqZoCCBMS/P
	GJMQL/+nrVIFPMxT9E+Javr1RuO138WOz5ikH+W8mFPeO7MH5hF7AxBjjMQIZhFAxnxfzqqhQ
X-Gm-Gg: AfdE7clo5amDe0s3nBx2JL35+ibTifW5VYs6mCw0rSSkb0YZIJJwymUD8O2uw7pzxp/
	VriDDblpmrzRPDTWpeAEu8RCPuoDBCaa2ikKMWPv0b8fsn6ARX8uV9eKKOVvtiT4mguousOrL+V
	YHV0L1CbuhnrIMz50N8UUEdBTQgSFfT+5cNV1U9aNKItqWnZSZuhCleZR2uaZDZpRe/ZKWHdwbd
	Rl66CiNMVJkNFvDnheODHzAOJJWqMcLa+MNzv3IZ6wUSTnkkX5HI8fPe7EVm/Ue4z4uhME8oAUb
	3ub4EAc1POpTPCCTOYqIiUYEcMyJaMLcJfA/o5qCIUL2TzJ6ZJnL2MqD92+NVzY2u0//S/Cb2wy
	xG1Xl0IHQtVnEFNkk8jPuuAqbzyPlNtr8MKro+bKwQnqUWhNUjUIdwEquvepl4nXIqg==
X-Received: by 2002:a05:7300:190e:b0:30c:6d2c:2aa7 with SMTP id 5a478bee46e88-30ee144e6e4mr4429777eec.20.1782854786542;
        Tue, 30 Jun 2026 14:26:26 -0700 (PDT)
X-Received: by 2002:a05:7300:190e:b0:30c:6d2c:2aa7 with SMTP id 5a478bee46e88-30ee144e6e4mr4429752eec.20.1782854786039;
        Tue, 30 Jun 2026 14:26:26 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260623151613.72113-1-nico.escande@gmail.com>
References: <20260623151613.72113-1-nico.escande@gmail.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid setting 320MHz support
 on non 6GHz band
Message-Id: <178285478349.1590147.1883672407470412706.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: KXxMbIO98j4Uu4Ek0ab-U6F08QrePcra
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a443483 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nZWXDgwjYB7QwpdpdXoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: KXxMbIO98j4Uu4Ek0ab-U6F08QrePcra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX9bwNwl0vLwfR
 fg4IaQVs4BvAGQo0HAs8sN764cul6pZltniSQF+T/bH1WL12xkF/qY2p3LErgre97gWMj/96lrf
 ZU7g0+NpmkP0yKXgSAZGZNdNYEDH33+tiZipYAfILUEqonDL5Rzj5KzIuQtCOXOevm7Y3YJ8tgf
 SrDlmDPuotwRTV7vZCNdRQKz78v7AATwqPcHrkrJJms+67JFhSlmLbOOXPw5U195tLZTL6F4pQ5
 5RdmPwsDGOrYXWptdiMCve4y3knLTac21vm+MJfPNjV+tAquts52ZVZKx0srZZyB8d+R/f1BLHD
 cERAYUymeGZ+LZBJ3Jx/Cb8JGGgctJ91M3cSX9ZrnG3co3yS/efWii9B1UXhX6sMwz4EPmcM+kO
 nbK2vis99SewwzT02gsqM0qdVbQ66NQZ0rPv3kOwom6ErJKVZcUWAbmIePXKfgYc7HUhqtBs18a
 pWMtzo86XVR4mbVWLuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX4JRzyV+FfXax
 pmGmfROoNy+YshbkCcul5F8UZQJvywkpAKosQOa+mioZklHxUJocaNMKyYNjlL7wD/JoWkNcLuh
 EQVIa/shf3yBceJxnNA9WqBUy+tMYWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142629_495555_D7CCB68B 
X-CRM114-Status: UNSURE (   8.30  )
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


On Tue, 23 Jun 2026 17:16:13 +0200, Nicolas Escande wrote:
> On a split phy qcn9274 (2.4GHz + 5GHz low), "iw phy" reports 320MHz
> related features on the 5GHz band while it should not:
> 
>     Wiphy phy1
>     [...]
>         Band 2:
>     [...]
>             EHT Iftypes: managed
>     [...]
>                 EHT PHY Capabilities: (0xe2ffdbe018778000):
>                     320MHz in 6GHz Supported
>     [...]
>                     Beamformee SS (320MHz): 7
>     [...]
>                     Number Of Sounding Dimensions (320MHz): 3
>     [...]
>                 EHT MCS/NSS: (0x22222222222222222200000000):
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: avoid setting 320MHz support on non 6GHz band
      commit: eaf478b3ea68e1b5df659acd24c4df5850e12325

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF0105D993
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 00:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=; b=rXTZjxNTmTTMfJdwkOpaUTiXtA
	OcU37egsZuDVZrsXRa7FMmMjbkhC2DzUbAS7Z/nD6BIglE5E9pC9Aoa2GmTiQXCUCgqd8pze4M1BE
	EPGlU+f0Hza+KigL4e4f1P46vpz6NIavgSM7/EQWCwigQ6LorCd9Xj/mIvR6cnFDfZx2/Nb7I0g54
	CtGTgV6Jvh27YIwhhdg5/YFdXFXGAYuftteXBMxxJQXA+S/CVdF6Kx743Nz8B3SzMbkDThlO0mj3X
	SONguulNjJTY+k/Vh3U8955OrBT7t5vy9MJt7wqIS6EfXS8t68y2KQUfLv9pzOrlZKmmVorXAmtuY
	gs/wmrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7s-000000083S3-2cBl;
	Wed, 08 Apr 2026 00:50:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7q-000000083Q8-1br9
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 00:50:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M4bXF2861191
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 00:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=; b=ozit/gvSbHcoJVGz
	CPR11U4zo2QpOIqtXcl3k6+zGBikRLbtrQVr5d4a1h3S8OG+LYXe1ZT2ZjPKDJ9b
	FnXPxfeg1+T0X/aVOz8pIkNq9VC18GzgQBRYutDbiIjo89g4Nql0GYNR6yZzaSvS
	N7EIAIm/wJccG6eTgLYdRy+TsvPAEWSfStmstOo7ICrO34Q1rBVTPz9z5YemuWUj
	evC3ztikv2vVAXXdNFj69YUXCHdATQV908f2H/jtzmosEREgoQOResAHcY/w0X3F
	lR89svDdwdJ/VZSdkXZ3ioJITapBSv8k16sgYU07AsHbCEQ57r0Da/pI8knxScin
	fR3JgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8rbj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 00:50:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ba59a830so7929789eec.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 17:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609432; x=1776214232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=;
        b=N1Bjfhc5JevZiT31YevKmlPJhq7ToGOYFLKn2QfZEjCHR2gn1FPrLSbry8Kvel9jf8
         mCuFQ4x9k8LFPRky+oXXi9e9d4apiQp4aUbj5C3YehnhgUmJ+ajudWN+obI22jc4GKtu
         ijcNjshKh+0GgURFeN69qsQEXb0zUiS8hXJ/aTFgmW3NM6+wM+2VsFe7euXsMiNAw7hv
         qGjGADYs2GzRsMuOQBp0GZGThU6ClJXiIJnlREUWeRraSWu6QccnyEd3Rs8pesSHK7nr
         7ZsgkeauaBwRBBumkybc88FNX4tBrJhtGDNRa1B/pTm+QeF1eY4t8oD+RF+gGt2ENrrf
         62iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609432; x=1776214232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZebYKoM2cJKcNc6cSC9v93X+hvHPic9bASAAaTI9s4=;
        b=FQwohJYw8SIOpaex4r+0Mdf6iV4H9iPm91O8nsn2f69HjdNRfn44rIMUJjT1dc2wkL
         Tb2unAJQXs2b+bUpaJeXhPdnx2BIL/0Uwjzk1dMf6+aEUTDvU66AiNMAylaE6gv1yaAH
         zX6ZGS+gfIY5jTe6JL3ujaez6Ph5j1CPfM7LYHL80FjDwnQiR84mIi1QhPioCDiSc8Eg
         00OPguu71xW1YokuKjc+TlJrEsLH5lzDJgVgz8LP/CGoLaNtpZYlLfpdT7FdpR3UKCbA
         nbaCobjxpcYgXsE7Bn7jSI0MJppBj08KotO7+2OmOeIm70hhOXPZ9GiHBaetEJ7Oh75V
         oBaw==
X-Forwarded-Encrypted: i=1; AJvYcCX9LYQgYyrFPD1mUvOuLkI3U//aOvPbNepRHNRymuF22Duh0zalOd03OtB7YeQiV//HRyuIZoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YydoXZLOAglXIUjOcRM4nkjDnHEzbRAYHlY1/+iS/Aua70cCJbS
	ylymGEcfgyAdsTNvvzbRz8KaOe8WKVgXu32dMhWOkRGLKalYqhRqhW/9a6zajF8GVah1iiain3o
	RWEGy4/ODU2eOi383jX9Ogb0AHvjk+eW478q9rBMgEy4zcE5w7/rs7fDQlUENXp8W
X-Gm-Gg: AeBDiesTa9PuZR9vnVpBCWVEvTlmPp7WQxQ9f00OUk26fvYmS783Jd7cetWs+uYaENK
	lz2OkCS2jUGi7WmT94l+QR3E2u464/8ienOH4zcK9yA6UDK4nJcOYpKKTV+wtjZiisp6VtOSw9v
	dRgYY0acMmoYyh9BtpX3gYPh0RoKyRKOg8C016aWblCFUoV+8uPuy3XIiSlzfraPcjNseNfPDXR
	AB6hiDOC2c1eUSpzXgjnBDML7Wy3jVEEhbkw+zZiYiJ5wT2m3NF/LRNgCJMJTDuSsalWNiforHf
	ZLlBa06uRK5COqUvMqq4Rapus40W4YSh4NWF0qpUnnotBXvm7lTlnyjKW3+euYFFh0oFZWeDgLs
	zzfy55BhcZWyUOEK8ZeZT6rrplBdKIjbzjZJBleNLPYe0j4BaahcA2ucPGwT5UC3mOfo1UquOTL
	C9
X-Received: by 2002:a05:7301:1f01:b0:2c5:50fe:c78f with SMTP id 5a478bee46e88-2cbfa9b024bmr8302631eec.12.1775609432235;
        Tue, 07 Apr 2026 17:50:32 -0700 (PDT)
X-Received: by 2002:a05:7301:1f01:b0:2c5:50fe:c78f with SMTP id 5a478bee46e88-2cbfa9b024bmr8302609eec.12.1775609431693;
        Tue, 07 Apr 2026 17:50:31 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Message-Id: <177560943002.2878209.1743406779357406462.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 5yF0t9CMZnpAmgV9HywNvN_drZKVSrEM
X-Proofpoint-GUID: 5yF0t9CMZnpAmgV9HywNvN_drZKVSrEM
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d5a659 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2XysiazmuIoG6y2HQ6cA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfXwKqwgOzTl2mj
 vN0SIHpdTy4S4a8wNdA26riM0hoBmPSo5DUhaQHcYLhauTtMZ82c+kN1sFc7ruouQYovbPoTsGc
 rvORKnfhs5vrmXsBLayBj3hDoIr49bNODeIb/AuisRyyGIJGTla6iJlwFAb1RG42hUI+vtYgAai
 1PFWQmOINQjOdEaYQN7BuEDB3LHaMIa5HCWj9Vx1oepS0qdWTxKNUPjje2SODeZbiWp/tEJpBdv
 +yuWY2uaWNem0UyM4b2EtOAtX0iGLG62jx0q8TYfpKt3vMykvU/4q/5rZPEBzBS6gRLaqXYaB3f
 5Thazr7B1cize3HslkTUYma1PaRScNNWMQQQTui/1lKWaRpoZ+yTXWzZ03rJFcmFh4QuqltedE6
 5QYui7bKiJTmfqewCAOR7h5sClA+PcfzWB9NDzVKwjZC6tkmDh2ZHFtN7kdD2uNIYfsAKvxC2PI
 Vtv7OlpfO+lQr7F9Nyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_175034_549591_160962AA 
X-CRM114-Status: UNSURE (   9.84  )
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


On Tue, 07 Apr 2026 10:56:27 +0530, Raj Kumar Bhagat wrote:
> Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
> AHB only supports IPQ5332 WiFi devices.
> 
> The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
> configurations. To enable the IPQ5424 device:
> - Add the necessary hardware parameters for IPQ5424.
> - Modify the boot-up sequence for ath12k AHB to accommodate the
>   requirements of the IPQ5424 device.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      commit: 3ebaf730b5832319726e12ebe634a7679eaf2e9b
[2/6] wifi: ath12k: Add ath12k_hw_params for IPQ5424
      commit: b1ad1a052beda2ac0400d6d4cc05dd2e549a6936
[3/6] wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424
      commit: 74f5a619b1a6a06cc5e6246d326da5b6f2b0fcbd
[4/6] wifi: ath12k: add ath12k_hw_regs for IPQ5424
      commit: 7e2131ba332f5ae62b6302eb889feeeea56a1691
[5/6] wifi: ath12k: Add CE remap hardware parameters for IPQ5424
      commit: 38cff745fa7c0b006f95565a2e5de9f0cac13702
[6/6] wifi: ath12k: Enable IPQ5424 WiFi device support
      commit: 8fb66931fe31094aa2e1b2a5c015050b8b4cb2ec

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



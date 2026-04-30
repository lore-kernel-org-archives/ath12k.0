Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93925CD3423
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj27SbZapOyUJvDwHwf/8ztbK6r7C+ocxgCkxyyRKWM=; b=sDh1GcsBEv4TjLkErvvYvlJCfg
	2Uj+I6hramW5b5tSciP7+xbxHrI2a34L044cRd5nTzcMwAv1o9sJTgWbhbHMP2cNpkQRbRa3oUPgz
	EtEUBmYShZXLERDCmGiECtAwQuqBKnJf0KJadLEh+pUUvNtd8bThngzflMLkf+cmCrFMq9uWD1B90
	QvVErS48f3FUTO6vpDMtyJ/lOYeCNGfqmjeax6HZdaw1lygyqRfW1S1iiGU01aWtmFdzjT7qWaa12
	RoLWFdmWfzdi7pXkCnNiwKl88mlvFEJA64oFxpBRfKX47Ifefv/JYNearNVyR8j2VYve3O/5VxEET
	VmTJHVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyE-00000005z49-1P12;
	Thu, 30 Apr 2026 21:30:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyA-00000005z2K-3swc
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:30:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHfEg8440698
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vj27SbZapOyUJvDwHwf/8ztbK6r7C+ocxgCkxyyRKWM=; b=aPcRaVaYm3RKHZm6
	jgVzkLemkCoeqIDDUMLbsTn0VhO0I466R+zbW6WAIdW7j/i6jYmgpsQ+HU5q5fiB
	8Av0M6LOPWutgVBzBIu3mpJ1xxL/ajFIF3Q2oJMDWtwe+SO8tmsB7VE/L+iyEDxY
	rG4jDc0yLae5nqRBTBU+/ErCmOJ7DQxP+Zpl2e0SFPqoVGZAGFTuP3iLzzlI5wP7
	a91gjwehP3IEIPplSGQLmKaOpNkkHoU5QQXXZydabLJ85s6aBh91F+U/qxFc+E7I
	hjB+gCqJN40TD/9E18+BB2IwT8ySemYnn2WDsdlKlrlxCHgug+XVioubnBgjBMjG
	keH7Mg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvbpw90eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2edfb206494so3560570eec.0
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584650; x=1778189450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj27SbZapOyUJvDwHwf/8ztbK6r7C+ocxgCkxyyRKWM=;
        b=Kn9TH4Cc6cmg5drjFGzdYffs3bWyEINlpoo+O0aAB2rkscKMN4W60QvFeJy7tmIEoX
         3i5RNiUbMzcG3UTCrBMnYwmsD0O4ncyzeMhlQ4rgXBl/+qKdRoa4vUkXm6gOGCrVHY6g
         pWsmP9yK/+jbwEohbTKJsuoDT59quaTl75wuE9wjUtQHQI0zfXJiLmlar9qDOKHrNrr6
         BMD51KHXIOfzf2KdY3ST5jBe9ZWv7N04zmzqgtcc3pvmAkVK3wecPttnTMYwfCTQCQPX
         yxB1oFp/IWTQqsQ7F1eMip82komEgSV37AVA+sCd4Vg8ESVNKMiPubJkIXmr0Fc5NRf4
         DN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584650; x=1778189450;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vj27SbZapOyUJvDwHwf/8ztbK6r7C+ocxgCkxyyRKWM=;
        b=CkDbUn6naCG/YcOhAPz2OQiUW+fSj8uoslaHqpdtyGkzOF8bHPp6/kT1kS15Z65Z2S
         EePkiY+q4O+McWQpaCwzdtc9VB98hC6sicYTsKIp5u1GXJMmqItTve6uFcLEgVFZxThV
         LGD43pMQCnDkSHEYTTu0Fh9eWS9RRf514MpQCvXmmU+ZBCvq2XWv93+KnNDGw+9BTA97
         2D/mPQIn7pH/u/MbOQFy6rLtxPrCMfUiE/eL/NxtjMLmyN4GIxxzzdHY+Vh0Hx0cDIgR
         PEWFXyT/PsU+Di9848YQUsrN8MXsKfmSBfhf+qcC0knybQIt2JphZiOgtxtiVdvZ1irq
         Vuqg==
X-Gm-Message-State: AOJu0Yw1cJUknstXuR1uiTcVFJyOCZUIR1g8m065AVFThq4eljEwgCnC
	3M7/81zdDDQVaUlgBHs8GSRm4KF0oAwjfsP4Ay1RrymCNUsvIAw5dwtLMEL2kBIAjGzrUsKiYWR
	CeEkB1EX7auEf/uBTAhfL0h/vTRBpVd9TrEIXt0T6JCLUe5GZLYFMAPcPvHOvmO6EgP9wOQD+
X-Gm-Gg: AeBDiesKlCQ+T9Di+cCbAgiaPY+d4U9vGPqHaZeKw1kVDnmSR1GoEtOomdcomHlbwrz
	MbLaIPJgAD6BnADUBHtiiEiot+VS63AQQbYOL+ncfrHzXvx0RFjK+Ov88rI1B8LTq5NzxPU3v7+
	WmLTMMRgPMNBd0eKyPwIaPhte4mb5sE6B7uNpI1ttcDDwN9yydt1bx0N0f5AMvuFZfq2eFKj5yE
	Ia4/idu1RhEtk19OQlMdEKGO/STpNjFnaU53vhago+6ztgwB4OjbGBeNMaSFS5Rpi+N9QvRxMVs
	wbAz8A8RFufBGZCAPRHpq67CxZKl30uo9Trh/8MEY1v4VLwGpkKa8PpoqrSoasWbNmklc/qOtpi
	SiNlKcuC350YhM7Zs0qPlBe48GprOMJAoCX1NBFEPeV2qUIXgm25hDB8ue4i6HWf0WDP1yeF61z
	Eij70dsVf9/RY=
X-Received: by 2002:a05:7301:2289:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-2ed3f6705f0mr2288694eec.23.1777584649536;
        Thu, 30 Apr 2026 14:30:49 -0700 (PDT)
X-Received: by 2002:a05:7301:2289:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-2ed3f6705f0mr2288672eec.23.1777584649005;
        Thu, 30 Apr 2026 14:30:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260418163620.3633959-1-tamizh.raja@oss.qualcomm.com>
References: <20260418163620.3633959-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
 type in Rx path
Message-Id: <177758464796.1848985.5158298683503256225.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=dozrzVg4 c=1 sm=1 tr=0 ts=69f3ca0a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=C7aa6aAfKzMjnWR6zmkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX9xt+Y8KBLRRh
 sDiuRqXF0lATorKFrExjx7il9mw/opCd9kk38iPbJ53dDf6BAnns85PyiQd/ygyCTxDveFWZxCA
 E0Vwtm+4ekP0cFudb2M7/2jmqdHj7jnKKWl7z/znPFR4yPIlNMkxS8S/nVw2cbZQiYB3PIfCuk8
 LJiCgQ1YzEmcqMYNtzhbG1WsIRUThq2RTEmZKv84YG+VQX3p66yKdXOk99DWB/5U/hD6NlsrxYp
 g4LFOinFXK+xw6T/MGxPoDjp/YRy4lZtoC44CY9IzLkfsF8ftmFi4O7nCvBDoAVII3RoarkueKs
 inT3QuIFL67RmEhChIvnY285LPgYUji9/zeg+p2DcLNCU8JoCviMGm4o4+KJ0T09e8KHrUERhVB
 F548SDIQm/Q6nCjEr4T7QIdsyQazx0q7lxhkNp7yez2XrLcorbeUMT+Z6ZewBbSMy4NgRLhmJ6s
 rdkHQGjKqwASkA7AXLw==
X-Proofpoint-ORIG-GUID: XTn0Pmnawu5uX3XN8HqaPil-g4Te93Se
X-Proofpoint-GUID: XTn0Pmnawu5uX3XN8HqaPil-g4Te93Se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_143050_969878_498F6519 
X-CRM114-Status: GOOD (  10.14  )
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


On Sat, 18 Apr 2026 22:06:20 +0530, Tamizh Chelvam Raja wrote:
> The driver does not currently set any rx_flag for frames received with
> decap type DP_RX_DECAP_TYPE_8023. When the hardware reports
> LLC-encapsulated packets whose length field is below 0x0600, the MSDU_END
> descriptor may indicate decap type DP_RX_DECAP_TYPE_8023.
> 
> These frames are effectively equivalent to Ethernet-II (DIX) packets,
> similar to those decoded as DP_RX_DECAP_TYPE_ETHERNET2_DIX. If the
> driver does not set RX_FLAG_8023 for these frames, mac80211 will
> misinterpret them as 802.11 frames. This causes valid frames such as
> Bridge Protocol Data Units (BPDUs) to be dropped. BPDUs are exchanged
> between switches to maintain and manage network topology, and must
> be treated as Ethernet frames.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path
      commit: c4aa897fe234a7bbfc0ba246df34137e3a88beb8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



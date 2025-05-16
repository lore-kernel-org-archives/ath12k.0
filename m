Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F873C5475C
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+b4mipyrCPJdbvZfzWGaBRvV6xkj/kt8pxJ9PRpOlqg=; b=tm8qx4AHhDIxTDY1pOwVz/ubp8
	/4N7LmF/Qdf5EsA+AAh6Non/+voZCnqaoLdWyRu9GA5+gCVeg4iGaErJWx/nRs4rUOkO8QGBORgbB
	BPxb/c0ciIhYYiliW8j150b5V9qlGdDhxjt83P/RreczGx0gEqwzrQgWZa40dHFr0w1KDZ1RReJBc
	PVoXlx9FD/qCtF3EHeA42VIruo6w1acC4HwngNyauIs7NAAdkuUDiW+0ustuIqVn2L0PQogvkgjC7
	8jUw8a6Ytc3ug6lVjIqvrdSWnAqN6pS1BYhTSbfyIFCZDB4fRGPGvkiBmYLlt7EJsT8sqL9HQxLhP
	jyNo/U2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v7-00000004TtO-002u;
	Fri, 16 May 2025 19:40:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v3-00000004Tp9-10Ic
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBRdZT022995
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+b4mipyrCPJdbvZfzWGaBRvV6xkj/kt8pxJ9PRpOlqg=; b=jumLbjB4Dh5rqC56
	AvPctt3LkJIU2iYtkhAZSRChledLzMtkohfUMIfHxjs+gW6YhlsTreuGHYsATchj
	rMW6TWFGqwG7bBlH9jqBtyHqoxQwuodJy1rBzSPn5w//RBl/3PrnU2ZpYe+tsgl4
	1dZWxuXJBlAz5mt/9Rox5sXNNbilvscd2P3o/XC6N9sRzvSHe812AOPz68usu9nM
	lVe62L5J2hpwbOAHVEYbaJ9MzyFFlTp6UC3U6Tr8J3nUBqrQE6yIM58RwLtysT4T
	GgjwsJk+1pqli92iILz/IyFN/Q0SLjDH5kKGVMslpihQt29DE+QBacHkPm7dh+Df
	uEK5qQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p4gq99n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e5cd14e48so21697105ad.2
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424432; x=1748029232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b4mipyrCPJdbvZfzWGaBRvV6xkj/kt8pxJ9PRpOlqg=;
        b=iaIWEb+bkoROqtfoIKwwiQBhwL9BtwERFj4AKN5n5PebspHA/6VfFAVkwNBAnDbWyF
         8R8I5t/YLS8bFzT4x5LOqe3P4q12riBSOfTYtSMjNXRgCkE1vAzoLozHKt0lL9syIBuk
         YrzoeeFNDFHf6C62LOGuRD207MMguAkZfedpWDp+QuVPNcs7HnlQ4RQkH4jJl28ja3ZY
         6NvPIDCUmHVlZeas34+mplGyhqIfa3Ry1ZGxa5q8liBykd/6VeHTS61Lm8HoESCjtAw1
         QWCu65f0I/6q7C+hd2T/i4ufgXmDPCo62N0Tr7tqnc3qPUeBKB7eHx4odRMdBoGoWIGT
         i2yA==
X-Gm-Message-State: AOJu0YzA7FQqQ2mUJSFedTeUeFuCPkUN2iXmBo+eKSShW8GK0a0WMP+3
	GKg0Ugc12jYyRO1AoEOLIQDHRgVhydD0NjmFHFDFDJX9qtvRj+xWvBxr0jaQmZIl1D78m+MKF5w
	n//WJrasWZR+MKcZulNM/+3IwySHst0KEgZPXaFe3qVEeig9j3M89GCP68oG9AAfW
X-Gm-Gg: ASbGncv35lR4wVi2vkwHZ3djIssao5Bf453CgU4dQxfB7blgbMNtG18jbtKTS6FiH7T
	tY2L2N2QFf0AaMsKSBMCap51ukyFakPru30mfy9A8UsnLiHYw0vMsgPpNmRN1pdY4pafibBeDYP
	1x5ev6aCQYY7hXXOTzBDjzuvVTdjeIgeC2dpuk/EKWPf9zQoa6TeekNqN12TVuIAG6F+oOyHMuW
	fleVJxxK+60Py5PZ24VzcGnJIDA2pJgJjR6Zondf5yG+wenrYyR5dwpwPkyKGqtCpRZIJDeIPkz
	YgQj6AzTWNXk7Kkf6F9eGYjrpegZssnKBPLBMZqd0mFIqC1W
X-Received: by 2002:a17:902:e78b:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-231d44e641fmr61831665ad.14.1747424431757;
        Fri, 16 May 2025 12:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM762pA60yK/Pp86FVSbdlfl+30uTirqh9IDypL27MMC7XJvAErYG0SFmv7Lc8RLcGCQU/sg==
X-Received: by 2002:a17:902:e78b:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-231d44e641fmr61831335ad.14.1747424431344;
        Fri, 16 May 2025 12:40:31 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 00/13] wifi: ath12k: add monitor mode support
 for WCN7850
Message-Id: <174742443073.3316767.14591077884677831955.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: Tp8Y-uALQLbxvdFyXwnVO-t7dZ1mqLl5
X-Authority-Analysis: v=2.4 cv=KulN2XWN c=1 sm=1 tr=0 ts=682794b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=B1sZM3WIyRSAwYCktj8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MiBTYWx0ZWRfX4leRtEri0vs9
 l9qiTIlesQruAMU/EflAbw3/gfQYSmKrUSGW7vsB0nK5cAyAVWl/7Catox0HHNknRqvGVdZSyo0
 Yi7IE9IwV7qtpjfZbm4DxDjhlfkVIK0LPX1jUDbsoBA0F/HVBGucMJU8hkG2Z1xzEdY3adsPAqO
 5bPm7x404JnUDxdc6Wi85+M+NTLFaSZ9dD/Of/maa0S1Jsyd1nlvVmHgy7t8RqCu2d6QvWm/GQ4
 834GLa0PovOY5GbDmFoy6HhWONlUwckIq7KYyH1saSRlpeZsR8/HpQ5CT/JMCDN607lzNhxRCO5
 MhHYSJ74VijV31OrW43MrMkPP/iEYe1/gvLqA+CjwW3mJpg4fWjkgoghUqiyS4mWS4k/XEudzPR
 IYmWmrDhtj5rXRlTZgbQjJWr7rJ4ctLsiOqhZ3yx0SpSR1jlJ4etD5YlCNENzdxEYBH4XFFv
X-Proofpoint-GUID: Tp8Y-uALQLbxvdFyXwnVO-t7dZ1mqLl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124033_286557_ED31D8C8 
X-CRM114-Status: GOOD (  10.38  )
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


On Mon, 21 Apr 2025 10:34:31 +0800, Kang Yang wrote:
> Currently, monitor mode is not support on WCN7850. Thus add ring
> configuration, interrupt configuration and ring process function to
> support it.
> 
> Kang Yang (13):
>   wifi: ath12k: parse msdu_end tlv in
>     ath12k_dp_mon_rx_parse_status_tlv()
>   wifi: ath12k: avoid call ath12k_dp_mon_parse_rx_dest_tlv() for WCN7850
>   wifi: ath12k: add srng config template for mon status ring
>   wifi: ath12k: add ring config for monitor mode on WCN7850
>   wifi: ath12k: add interrupt configuration for mon status ring
>   wifi: ath12k: add monitor mode handler by monitor status ring
>     interrupt
>   wifi: ath12k: add support to reap and process monitor status ring
>   wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
>   wifi: ath12k: use ath12k_buffer_addr in
>     ath12k_dp_rx_link_desc_return()
>   wifi: ath12k: add support to reap and process mon dest ring
>   wifi: ath12k: init monitor parameters for WCN7850
>   wifi: ath12k: use different packet offset for WCN7850
>   wifi: ath12k: enable monitor mode for WCN7850
> 
> [...]

Applied, thanks!

[01/13] wifi: ath12k: parse msdu_end tlv in ath12k_dp_mon_rx_parse_status_tlv()
        commit: 07a273d1e6f4b1aa537a4028b5b0ee0022cc16ec
[02/13] wifi: ath12k: avoid call ath12k_dp_mon_parse_rx_dest_tlv() for WCN7850
        commit: 5887ffb18703cd64afcc2f6364a5db11ce2751c3
[03/13] wifi: ath12k: add srng config template for mon status ring
        commit: c703c6acd6672a3f7005d76ff53f8ab04ad6c90e
[04/13] wifi: ath12k: add ring config for monitor mode on WCN7850
        commit: 4cd8b48f5d88ca0006952de93583ff827cbdd33c
[05/13] wifi: ath12k: add interrupt configuration for mon status ring
        commit: 18d26d156c22a914e9d461d0305a8448841b31fd
[06/13] wifi: ath12k: add monitor mode handler by monitor status ring interrupt
        commit: 5f15468f5fd3353dc012bcecfa0de2b9390db572
[07/13] wifi: ath12k: add support to reap and process monitor status ring
        commit: 78d3d907d0f1c7c0df866876e9e551cf22d5aafb
[08/13] wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
        commit: a69bbf89d751ba2d6da21d773c4e29c91c5e53c4
[09/13] wifi: ath12k: use ath12k_buffer_addr in ath12k_dp_rx_link_desc_return()
        commit: ac885978a5ab49809784b3ad20b4cbf7f14c664a
[10/13] wifi: ath12k: add support to reap and process mon dest ring
        commit: 72bfbf19b7da6edc6db1d8ea81751ee6d31fe2f2
[11/13] wifi: ath12k: init monitor parameters for WCN7850
        commit: f4dd79e9b5d3cae04e166186e7b325453cdbaf7e
[12/13] wifi: ath12k: use different packet offset for WCN7850
        commit: 1cf514fdc7904e0a29d694487e0c36d3595e3717
[13/13] wifi: ath12k: enable monitor mode for WCN7850
        commit: 6c262794ad9dba9ad23224d002e1ba5451f71fa3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



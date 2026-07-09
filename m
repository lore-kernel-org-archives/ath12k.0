Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F4BC44507
	for <ath12k@archiver.kernel.org>; Thu,  9 Jul 2026 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=; b=l3Cs5lTjHtMEV7Y9HL3V7OHY92
	8BCAFIRjCWXX6T7/+vr/tHfo/OxYEXS3bGvLxu8iz6m6W95jBLWj0jXjlKFhvF49HSDBCLbACPmz+
	BXBA+I6fiTNec4aIL7AeXT9rU5MAZErEqKXCRE+cE5WUlFL6OnpPIdidXt2EHLcPvOLB6S+vjH5u1
	GPR7zlNzegiU+gzikroGLVr6/LCDzk9WWOgUJqDV3yaql2BJg8mLstrgjoPkElQaOI5yXN6ENp5uS
	0yG8hd3W6nxl1cNZNHL3I+5WQh8aneLgmfS+0U6ioZg8hRWeM36KRj1mwZPP7T5MVto0EsUCqAOlz
	9JugU4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4d-00000002pe4-3uxm;
	Thu, 09 Jul 2026 14:49:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4b-00000002pbe-0sLN
	for ath12k@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw30Q1972334
	for <ath12k@lists.infradead.org>; Thu, 9 Jul 2026 14:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=; b=H74RRCgdHLu2YCyC
	DPR0TxCBM43IdK03QWzGeNG8SziPIBWoNYgwWq1WJNV5k4+xPl5S6kQ15LEjGYhb
	fECYv/kQWhU83PCaXttlWPeiFZEbhUs8yVTtknVJR4ASUh/RsH905Yken/P1dRD1
	ba4gMbsJvzwOUM/+pRWNndwGl6UWuaUEFmRrq7o0Isq5cUPqh0GbBqtqMLVV1At3
	zSF+oU3DyE8435JKNu2UErzOsSeGboKJQjMjUMUZGIa7fDdNYxCilI5Y5g409vQg
	ngg7/OjMzyVMasWGCbyJUWUfH9LR4IFxJxzdeG2DZNwJlb5v7mE5stv3wfgBYlVk
	ua83lw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvv9ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jul 2026 14:49:56 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f5b54da461so16710477b3.3
        for <ath12k@lists.infradead.org>; Thu, 09 Jul 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608596; x=1784213396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=;
        b=SLGwAMxRyzjLnrxeWBv+g3S+n9GbLkNTtMSfRVwXHc5+pwsYq7ufzfHub4klSI/VAl
         /wXi36OA4ZcXo0pD2y0VN8rqEjU4WvZormLZdVfutR+8v/8KiigKFDFU9S42QJYipkO4
         dWNVXmMwpxVo9BM4T8SwymqBMdJZfkX2UiO9gh1v8PCJWMxAki+mQ6OEFIdumPIWr/XF
         ndWlUfGshXAHFBnnf0kYKDD3/aXZ8V7kT64VrkFrdeFs3ISUk6B2X0fw97fwUbzTxbwK
         f4IwfdI0Ek2oDcGTV0FHvlMCl4Rix+NHl34YffWu2a/cxbp9HwNL319X1goO1TL2llHA
         3LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608596; x=1784213396;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zH4q7BWi2hgwClET7u+00rOznpP+Ykf1PL9gpdCfoHs=;
        b=Ku0HziiUiO0UK3zWIwQdEf4WJAbOW/djhUC1sJx2ZSFcdLfKmUzM7tD9MmMlOvxUMX
         x9k7qQv+V7LO4G0cH5o/oOa5I+DofE0RbGQ+FF4qmPkkHdHvpf7DwZGj2CV3yrFVKnXw
         0MAyfF7OeL2e9GWS4VaYrpi5pEvyZhdumTDdg9UptajI2QneTJ9L2vqfdncEK2iCmndC
         QQ0M9Ss5tqLWT+8aelrTJNsIqw0Ub0Ou76v9N9/o1ip3u65ryZX8REFYQHWdBOPSaloG
         zP+7C6SI1bYw/Tb4rkwLj/rt1VVIxf9yMPiqou9PHdpM8xFS2GaFA+RsEq+rFHOu3+BN
         LV/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr/e/3548ZBKHTTg+/BxedXht8iuSRln4umG+gb1JvZe41kjYiSPmGHsytHY6prXwoucWwSodc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+DHgCENk9yUdut1rGQt4FnLt+DwUuRos3uNLb3pGZt4cFLDTq
	xs+XqWO5RgVYxlvqh0Yr0jNTBe+gTtye5FFTMzTED8vM78koV9uLfLmH7zhC3tDCrZXqaLx4ysT
	OyNkk7Sv0b54mo0JiV2uUm902exL7Q9irtur4/qp1vYNLZNvt5094RKQNCPt+KdwC
X-Gm-Gg: AfdE7ckzopYnIERSHNJToKrKCDHOMp6KIvaFrNu+A8ceJzcs8XREUzbQqqC3NCSDush
	cwRft5MO8jqmfvR/+1pP+ToodFO6GcshCeVPs2ZMj/WdUyQD/sKHTRKpA5Rwqku9kq8jC4tmxwo
	KktBNEQP5ClPQlPahzTFD+GwRberM27YSkbR77Zr8gj6tCAYhQ7DpbR0K37xc1rYnvlklBea7Sy
	+XfHy8lc+exdcdt8johMVa8ojT24aDinxWIhqlHomH0jlt8Pu5qoHZyh3Hn4Lz5XsXCy8u1fWih
	7XcwmzqSaLYHTWyZN+oswWhbxYzRAuFfv/Z97uYxl80b/jFR1nUEZLEHfwAysogitVh+ZDoHTDW
	tI4uwFB2QVVPawMYJiensZOseNC8NhkzIqnaGEeMN+GugCBtonTO70iUhNcgk41ugnQ==
X-Received: by 2002:a05:690c:3707:b0:80d:d0ab:6d2b with SMTP id 00721157ae682-81dc0be096emr63289377b3.53.1783608595753;
        Thu, 09 Jul 2026 07:49:55 -0700 (PDT)
X-Received: by 2002:a05:690c:3707:b0:80d:d0ab:6d2b with SMTP id 00721157ae682-81dc0be096emr63289107b3.53.1783608595327;
        Thu, 09 Jul 2026 07:49:55 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm4989277b3.26.2026.07.09.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:49:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, Alex Williamson <alex@shazbot.org>
In-Reply-To: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260623141649.41087-1-manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: Flush the posted write after writing
 to PCIE_SOC_GLOBAL_RESET
Message-Id: <178360859334.1031194.3081866596289507374.b4-ty@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 07:49:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX3bNSCOLGvge+
 6xSlFuJPInbHmFFSCxYoXchQiDWxJ0UtdUDait3K9F9buvxt4WQBuKRfsj74z61lPhRyNWuUX/z
 oqUsAQgxWuvzhSvm6LkyVTc8pr0mH9c=
X-Proofpoint-GUID: 0LhJFU9ptHqw8XiLdt7ag9BOM7H6E4Id
X-Proofpoint-ORIG-GUID: 0LhJFU9ptHqw8XiLdt7ag9BOM7H6E4Id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX+SUjN2hU8hLc
 iKjLf3pa8KTiGXwWL3JHFhKirVpHEpNrx/UaZeLKB2Jf9RLsg7ilGUgXMNyMxLV6Ala8DsvjffN
 nRexX0kzFYdTpHwf0HqI8rFN2dYjS/V/09TVRnnJZ3y025XH/bQYe/DtoGfDYZUkD76NnQJv6Mm
 PVW+m6SUjUA98gUINdZBEES3r9ej8/sfi8bShkjSIu99na0aTD1fSG3A/Ifp9ekoARbtdnox1y+
 +vwffOwlvApzs864IUKseJNfYExAd/ZALWa6TrSrItLk/u3Xv7e3UxzvL3dYE3ccOrKwMeIn6RH
 9lruPakKHrmK+6FN+CaW+0h+LuBH93TWQsIDaxoVTo34dMvQFJKxQ3cGqvCAiFchjJ+bNx65wAh
 xLkGmf1Q2a+7+qeayst6rrHNOafx0iDbiPQDJ/chG5U7VhUAeYsJbc84EqpREkFUkqN9xFNBPLv
 r6b8bnI+/4w6cddTipQ==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4fb514 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fjTVS2QutaehiSyZ5pEA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074957_365959_4438B462 
X-CRM114-Status: GOOD (  10.40  )
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


On Tue, 23 Jun 2026 16:16:48 +0200, Manivannan Sadhasivam wrote:
> ath11k_pci_soc_global_reset() tries to reset the device by writing to the
> PCIE_SOC_GLOBAL_RESET register. But it doesn't do a read-back to ensure
> that the write gets flushed to the device before the delay.
> 
> This may lead to the delay on the host to be insufficient, if the posted
> write doesn't reach the device before the delay.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
      commit: 0fe8010fc5b147607fc19ba010ba469afc95f35f
[2/2] wifi: ath12k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
      commit: 55f3aa06951cac78b0206bde961c8cf11929a27a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



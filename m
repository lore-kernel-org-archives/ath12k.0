Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1871BCD8CAA
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNp9PgYvqtqRrJpy8tj4U4zpVli5lKE3Guj8hmd5vK4=; b=fU8Lru70apjdtaOgWPFH2eFNlN
	JuXW3TCJ5PG5cRfVkWuTiP03ilJqxLUPIkPg+a8dp1GggyvGzq+qpQsvewOLmpABUGQnJaVJSMgKA
	rftwIiZNoUJidnt+umYqxIW/bdV47AYlbwzXDtdZFAQwYAjUvkln5oIgwgDtAx5JUK4tNAUD5KRWL
	lVOv7yfCRPlJzCw+KgK+nQYlba+izcXi744OroDnd4Tzz+EWxoFdRt/62SCJ/N+a0vQqt6aXzZwig
	863GfTJn0q/fCa1kxm2EnokzIoaPmZpS04Z2CITkUQ741iIW1D93ssb9VS0ASvR2KEQ9ySJVxcytB
	MNPdaOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvE-00000005iFi-3dJK;
	Tue, 09 Jun 2026 13:55:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwvB-00000005iEG-2HQZ
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 13:55:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmQS42625093
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 13:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fNp9PgYvqtqRrJpy8tj4U4zpVli5lKE3Guj8hmd5vK4=; b=l4hpcenHn3dL1Mt/
	8+d7X+e83Qx2oQuc8st4gyGIzUWyl+13h4ehvpamQNf24jdVck63BejnvNFjF2NL
	YZLPf6+S9+DvHbHnr/urqx7L0Yu59mnM/srsHaAqriZZ3fmoQ1x/TOaTZV5cnz/l
	OchLWdTss1mLppH6koHdtR8DeObfMhofFgUnjmrvgnKmn+AFsp0Q/w9KoYfVMgne
	PPoCdAuiY529P4CdHOTrNTOC/It1GRIWdkMdk84MpzulFQm3Jqn40VIsPYAWgWO6
	gtfYpQ03I8dTTi31VmEtI9vTyLQ1d+DDYi+uu+b7WjJtXR+ZVzVZlnuiVEnGNY8S
	1pgg3g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epddsa0k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 13:55:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30762d67a64so7881490eec.0
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781013311; x=1781618111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNp9PgYvqtqRrJpy8tj4U4zpVli5lKE3Guj8hmd5vK4=;
        b=Djzk35XlrWkT1IUWFXj2GSnwLP7X4CfmJWNtjkHNtG/h89tb4SIOFxTmOesKse4/Rn
         MTY7o8KsTU9ZjWd0oKjSMXeJdbX0fv+O/EMjwlmOFzAysKvi0O7kOr7LLtUWDHchKAR4
         XI5cvSbgVMES11nOhz7/Q1AIw8MX80G5IPmGMEo+IvlWryoOdA93g1t5ZIHVX7BUJhzk
         g6HYXN7HRGAqwmgraPwUnUa9e2LFTzA3oJSLKkYfEXvLM+yJadJTCNEJMVxgQJ9ir1IG
         GATftpr92x+c/F/Hg4cvdweqp1qh8js2b03vghaoPq6Y/ydb7PqeWXQPsvvgPNqVux91
         hZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781013311; x=1781618111;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNp9PgYvqtqRrJpy8tj4U4zpVli5lKE3Guj8hmd5vK4=;
        b=sTemAjbHY+3n5II16dh2lzHNCkPRU2xx0WC3P/2lSnSuwj/bUrhOwqOQ11mwm/vA7o
         aBjGVRds0wjGgWOFWpNnW46VOSYVNqU2I95ujqF5FwpxyCfDN7plBWhslfMOgyN/r+GM
         cEq4RBYSnxXVN8ZZVYLP++megNWOAPQ2OfQ0SKkXRejLyOURsCY2LWUUtVRFXuacm2qU
         zBema1JIaJDbee+ppfg5g4voUS5szXjV0IRdXr0KWhMM0aOHbNxSWrQgBgMFNFYNA4Tn
         lIDkOybOBBuJK/d0cEW6yNmQ5z+jJvPHXZeyJCMOZ/MvskNIuuUtP+Fy+d26h3oTYRd+
         XB5w==
X-Forwarded-Encrypted: i=1; AFNElJ+oTfgVzIL9veQJ1Ko/S59yJl5BvSLmuWhkBxZcFTqHzQdkx+ivqhF1L3W18MrAMTeA9gX7wDE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHI7vxrpM/kWK9J5x3to2nU2Z/1/qJqJiaKoJRSmVWp0pgtkZ
	YLCdGbP0LdKMUqXnTskuChb7sRCrj9eYv3bWFK+r7DPMdTq6MBi6cM9SZlTKiJxq39O4DXwAi5W
	4vcP8m0op6ylrQ/nGUTpMNdpByzKLPby8MJ7Eap3zKjhUABdZkUmQbVr0Is3mcktP
X-Gm-Gg: Acq92OH0/GsaDoctdIkBUYDVyQBSDVcmJsu//fuWjBKgWW+5ytvp67ZYzGmBu/Ly3VO
	bYtDjkD34NmJ/k6fhc8JPhmODveDRypW1kV43yADrglez057dG2HGTlPJ+J2vrEEsV8wvqlmLju
	umwxoJ1j8YQQFVUEfXVnTkndiQ4ZE4zHoBLxreq+Pj0CxjMy9nIQ8Ivm5X5PnqVM1rL8sLOfcUJ
	YiMOWQrCmbDrwdsLdly9aGrUI/KaNtYTUUqUR5D7U2R47ufdG2nytPtUWeS5V24wC888VZKTLWI
	JgDfclviP6yl5DryMQU30w+kWaYB7Q28GZy4sJ0cUHPBMJtm5GzeOOdWaYbfWXQtI+AeKyKQPE/
	rzjj4E8Boa+MNu+oSBEddI5hboxzcb26Vekkbm+LTVaWI0qlw2uqRBIBZ4Tkk8FEv0MJ+KJ1+1O
	dUlQXtU9pgssM=
X-Received: by 2002:a05:7022:ef18:b0:136:c443:80e5 with SMTP id a92af1059eb24-1380666051amr10703911c88.6.1781013311104;
        Tue, 09 Jun 2026 06:55:11 -0700 (PDT)
X-Received: by 2002:a05:7022:ef18:b0:136:c443:80e5 with SMTP id a92af1059eb24-1380666051amr10703880c88.6.1781013310607;
        Tue, 09 Jun 2026 06:55:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54c9c12sm15289555c88.6.2026.06.09.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:55:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260609-ath12k-fix-eapol-tcl-metadata-v1-1-d47e6f90d4ee@oss.qualcomm.com>
References: <20260609-ath12k-fix-eapol-tcl-metadata-v1-1-d47e6f90d4ee@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix EAPOL TX failure caused
 by stale tcl_metadata bits
Message-Id: <178101330973.3249128.16418465746928021025.b4-ty@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 06:55:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: H2Y6LJDdyRsmJexJsdZN_hD6SxHwuAd8
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a281b40 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=E298BOHA-sUTKqM6pTgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: H2Y6LJDdyRsmJexJsdZN_hD6SxHwuAd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMiBTYWx0ZWRfX9JDzgO/tXmPd
 jTRMoQaLrmI8e5TnNSXynWqGiR5NBDI0KVna+srgbsSeyCG5aqgWqv1qtmd/CKGdCw1H14rgwQN
 7jPghKmE1w8Onx/CTpeEoN6OgTLbzDFUkHdGLPBccKPnPpXrjnM3H+Z6HZay79Xvn0icRsX62HW
 v4Jbxx6A0rh/BztzMPwocOqwys08bpiGaMO12db0dDQxW5SzQ2j7MaiwrHQe3eYQuge3y2mxT80
 5Ehd5X/FKP/w/A77ZPIbL8b1wyqpqfkv9AvNDYUm9lZk6YHQPostBgx8vMmzWqikL8X+QL27ZtN
 xkGoJ891nb0BwSrUUmTxeijGEiuroQx967ZSJe5rcx80y7Q5x92DHEDDRPSgZxzO9mOkz2fLkMa
 0aHdKGs2kgd5HqQUrokN8DdvB0atUlbOBQocU36rrqkHcV9gfQ0yeG57ImAuQRiQ4i+Lr8CZ08A
 HciM9Gxd2byvOpAvbtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_065513_851263_03467D99 
X-CRM114-Status: GOOD (  10.30  )
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


On Tue, 09 Jun 2026 10:10:47 +0800, Baochen Qiang wrote:
> On WCN7850, after the following sequence:
> 
>   1. load ath12k and connect to a non-MLO AP
>   2. disconnect and connect to an MLO AP
>   3. disconnect and reconnect to the non-MLO AP
> 
> the third connection always fails with a 4-Way handshake timeout. The
> supplicant transmits message 2 of 4 four times in response to AP
> retries of message 1, but the AP never sees any of them.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix EAPOL TX failure caused by stale tcl_metadata bits
      commit: fdea4d44e4b9c3f7021c85f8cd766e84e224472d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



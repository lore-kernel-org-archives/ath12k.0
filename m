Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B97AFB5192
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=; b=nGmDwN36gNON5cSqVxwRzQGBLY
	cFRGUTrEzg1jVSkiMrzqJF+q6gdfW8imbhPIhQjL//kpxuu1ysXklpmKuQUREWrQe9yxwy5EJzOAv
	ee+Mkpis70Gb+cUCXh4WND3GcmpgVglhZ6h+03P2kNv8Xg+xQGMY48gYGBAss72dHom6/8QufugKU
	bZeDvyLuqt+8+uidg+e1rwzEED65KW9ReEnjcX3Zk8Cn+QnEsD6uTg7ykxaPyBgps3W2oitfnJ7FZ
	TDjFGtGkcqXOZnCFuun0YR0k5TIqjtTlEkxpbBXkrq64lZ8UAGAygXJSDQvCPcwB5rXNgUGDdnHSC
	o8nbJwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxX-00000005upr-10gn;
	Tue, 07 Apr 2026 05:26:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxV-00000005upC-1LjR
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:26:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQcCI3402379
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=; b=UtybaZtpNuwIgnyG
	O8CFd4bbT2ohmZr3RZJF3G4hkHd1mk1LBdst2K4q83TCH36mIL6eZ1CTfq7nwmwU
	P190/bIq0xWDDL9O73Y769hu7+UwdFJK7ddARMgabS2HBfHdhMWBXwGxU+0NUIVj
	qhaMQ0bDdLkCYylbFtpXVYUXLJAOotzvBtWlgYGjjKNDEu9VrSLDxQLkOevltMOU
	l2g/ku1PdlfSy3dGj6ikXJN4dQiQYQo3Js1wX42pZ2gFiJI9W+TCDnBQAZqMpez0
	VHBOQYLB44sI1s0LQOxoseNUds8YFdS0T5fg8x6G+q3ihnMu/yUCCOVHBV5B1euE
	PModqQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhs5k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:26:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c9364612fso6873073b3a.2
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539599; x=1776144399; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=Z9y0dkyyk901P1nSXPPMEh4YR4jqpKzzh/0K6LUGZVDfCuGWMRjuav2350p8ioleOM
         3rvjANzZNvu1Nk7C/ufE/bpbf5VgbZZnM0tQj8CyiERNMUN4Q9Ph6EbAUmw+MhASQJpa
         Ctnt+6UXSNDWLRpVBtzLJ6gwzJFDstqxjwfYZB6mtQ/HgnihFU08yING2v4tgv8D29VL
         2ddRX9Vl70w4/oo5gR4lvpgf4MRbalrwBgSFV29fTCIqSHc6LR6V/tNU02bW5rRTuB0U
         2/nOTn/HyzXPey9aurChRQHy+aZCL1qJPqI39eSjGm+U343lbOqFYxvObD/Pnlopauuq
         ICGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539599; x=1776144399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=Kk2uedxKt6rTf/Yd/yKOnDfM8WIvCkV93kpDGFSyWTpMMlOIu6dZXlYPweaZDnTy+W
         IWoH5ADsqEJw2PxoeDZUWXBDkllTB9ZhuPUH6zrgf6BhtHg6ViBObdvxIjrjzlTk7/qT
         ODrcAjuO/xeU8/DfhhJSvtEzQ0t4bJlzI6NwEh8N5WIpLjVhaD1gsWVhsZ/5CIWzz241
         uUl7sUYz/HA4dh3u6Xr0+vecYID8zABnkOsOc/JneKiGAGtpvFh9SEN4YmU2AhlPqauW
         YE6DTD1rBGMyZqdORtL/k9w95I+uUEqYlkTDlMF8IKQk464EbKemBrHzYtwbX/849tvk
         X1hg==
X-Forwarded-Encrypted: i=1; AJvYcCXqYUT3gJbzLWFua0YB+yCEO6ZfaqvnVgO4ko/IEZa2euCbiNdGDWHCNJ+3T2K44PTdg9QfkPA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp89al1nSlVLjknRZQBu+fUZUtuv6oHamfIdCpaXE0qjWJrwi4
	3Ue9Qe0mqGqoNZuO2gFd6k3zJGw3iRcL11w9hBuQTzQixmXkdC9PxLzuf/OXaYpLvmKYOSuw2z6
	josBijQH3l68lmv2gWF3xHA0xoHxrPe/cniUhfV08FaGh0aznrp73P9ujGB1BQgRd
X-Gm-Gg: AeBDietPbHTr+iAlJ7m7mGw/NdbOt6g3atDI/1wJoqJyqlHT8zlzT7F1BmbY5Rt6zvX
	ki2DkuykRinLUjxlw1mYrvIIYYP55Z3Of4izHH0OTudcgg5rCPbtv0odJiFW1slQ8z842YwaNAe
	MLHhvzLbZz2SZ76qGk0wEzcb3gGTrDZ5PgvNMS2hJS3lhR3HVPkgXydPiyUA6skeJD6fKjTgL65
	AkQXe/ZDeaLO8bzi82dEWLFZzbNIPGWISxKOgPabbn4s4hFcLojCmY1gkNMBPE/wR4CuFmkhfi7
	AUw6BPyBGpGz1xMPHSBxYODTS4SA1fhAL5TVz6Cx1i0mJmxBHDa7N8JRZ0EXEhiorU9Rh8pPn9s
	YBOrrwgMksIpEwTCpSrxCPsWATTOKgW2PNFIzEs/xkdqb8J3nKfxjp4APfvSXMwOi8+UqMFv69z
	BIhgeGmyr3suOYAXLL5sW0vpe6fwytwvuXMo7qCLk=
X-Received: by 2002:a05:6a00:bc0b:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-82d0da284e4mr14976081b3a.8.1775539599382;
        Mon, 06 Apr 2026 22:26:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc0b:b0:82c:24d5:21cb with SMTP id d2e1a72fcca58-82d0da284e4mr14976050b3a.8.1775539598980;
        Mon, 06 Apr 2026 22:26:38 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:38 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:28 +0530
Subject: [PATCH ath-next v5 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-1-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfX2+Jy7VEz123S
 /X7UYfwSwP7ObHErnBo35HhZ6a4Wjg5zYpv6IbODN2Oeb9Q+k/uxXPN/+RJNstlKdx6CbAjNVbo
 rk5pXQODZkoxYdWAtDkUKeILTFzokb7DExJOl+pVvvd3UslElenzI6yH5KGUbDOGz93K1k30e/e
 oMb76slbyicioJMCT/YbslyeR7uPYRFMFy8ki3cxqfMf+qnVsh1ZPZsDUnsLx1NNK6StnEGx+i+
 K1tceGvCdpM7ymqA1GhjhIZjJLca/1WeVUU+lQQAQRN6ZY88O2n1BZ2KMENEZ7eNQIRe0K6fx+x
 6Unw/A94rYdh7YfXQvfqNg8WDgqBO/5XljOH4Ny3HrqtCh2vjbr1MdO8QXU6xJuD9/jK+KXIBMh
 e5mC/Au2EDYk8h7srVMlYfQFMlNOLA11Qp2kwB451Z7k/VEyiNy719K+zg67hLSmLv8s5hMz/N6
 iLmoCKS5CQInB+/5DrQ==
X-Proofpoint-GUID: KqU5krf6reYF1hjmGZhb1gVodurbEYFP
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d49590 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=HmtOZnpMNtbFe9RdH4EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KqU5krf6reYF1hjmGZhb1gVodurbEYFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222641_477864_CB8CF406 
X-CRM114-Status: UNSURE (   9.67  )
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

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..37d8a0da7780 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1



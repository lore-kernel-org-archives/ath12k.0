Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DDCCAC582
	for <ath12k@archiver.kernel.org>; Mon,  8 Sep 2025 20:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg2UgokEeWhMc48JRI2mp84dAZ/f8bS+61znB0C+pvU=; b=QxCEKaJlkW5vyyO7jWYk9Z+1b7
	cghCPWF83ExyIZZB8cxHSns9f2EdXd71U3AOu6TpFDdEDp4wRxkR1Ok8Ra8UexVENP0f175C+pdRq
	Etnv2CArAOBaGBKHyzhVsoI0hOnEouoxIoKzF7P1t3YBao3jxBd+UhyRyQWNfuSW35U+W2IZWXIvY
	GWGzFstkfJ0lEi6IyYrjGJLQ3BDGgU48Kj+/RQwgz+gJH64+tl1v0UZttAzZQMlJqRxVhHXbvQsOR
	hz96gsf0+sdMelllvnPE9EIpzy3p7ST+3dQwnkJYiR89mA335FnRPVkRrNm3bOIWwtgsVojaCw551
	rd7fkWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvibX-00000002EAy-0Wdj;
	Mon, 08 Sep 2025 20:36:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf42-00000000sWM-0hy2
	for ath12k@lists.infradead.org;
	Mon, 08 Sep 2025 16:49:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588AXAJ2013496
	for <ath12k@lists.infradead.org>; Mon, 8 Sep 2025 16:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg2UgokEeWhMc48JRI2mp84dAZ/f8bS+61znB0C+pvU=; b=OJIa+OnN04Ie3fWo
	MlrJaDYr5UfsJCOk47esyBzp/1kdLAWVOZyZCkWDJkT16me5b/sigwnmOSwSMHLi
	Y5JgRGOCA0sbkQYuF+R2YfrUUISqEs1KJMBO/EnWcywiSjCgcWp6LrE8gPadrK7l
	DZuZqXW6XY9MIrSYuWkD4MVmNtkaBlOjIzq/ev+AALmuTEaRyKe18UJXJj4CNZqC
	leaWy86Wg8kMkF5CD2df1zxyVM/ZOORFpCcBUMxexR8ow364aD6rMR8IsWFj9QbJ
	fd0f8GgDAxDyDupNHJBIJu2t8LxrePjqWKKC/6krQ0OTM8aD0foag/NqJ/5MvzIQ
	i4RrDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdt4x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 16:49:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24cda4063easo61408105ad.2
        for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757350196; x=1757954996;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg2UgokEeWhMc48JRI2mp84dAZ/f8bS+61znB0C+pvU=;
        b=qGQVQn71X6H7H1jxBD4N/JCGHfSpuKYkOr9rLXPOm8Hfyy0bijnbvOP9VtcNdR3SRi
         dfj1Nl1bm/IcY8zFco4JO6T254zpGQBI3aMupiETxkxQijVeX0vuAWoDtO0XrcvsWqZU
         ESwrqIfyeRVMpDyIcwc6RAd7tkQlV1Bymj6RETORdHFoVX1g4kP7TsiUSI4rHRDOKY/i
         KfVC7oM4YMTBuL9BA/KmzQx7ITsNXXLk1JTbPs+k2yhEsbsFIDu5s+rpNZyu/TqCXRWv
         Muk5gtofOmYfu2MyKR0VQexmE7L2WmBqeysIblJmkQPYbvutFROWRJGSzHz/hELJQxQw
         JEoA==
X-Gm-Message-State: AOJu0YzyC/XPLM9BHQ5lcEVLgiEsPyBixzOKFFTpiczZJ9XZTzLixihT
	hm9wq7TFN26OE5+VrEl2yD9aoM3Ag/rOdqiDWslJP4lGofMjpNul7yr+jgfzEgOZsZ0l0dgQPKG
	hXI2sWo7UfVYcuice1LNxb8jO+Wm1eT0G4qDzzt984Usv9F9lH7kgVlz/h81kaLJA
X-Gm-Gg: ASbGncuD0mUEAL3l0UjzhvhusUGH+w/th3uQyc89G3K5rhxGcRXC65fHkJBOtCgsXOR
	qILHFq+aHp0JQXjnZgNF8tDA/ihoHX8w7/6zwDIkNzyykvcKWa4yMucNb+VFDyXFP585fpWCUEH
	lcCv4b0LcRyVUEpVxySPTjq4+Nk3jGm0KWOALv0v5I6YJVSANrQEHIgc/JjlEq0Pq8DsZIg03bb
	nKAW/xQ3uRBMA+U97o0/EA5aaJ0pm05yXTKxvn913tcvjoN4er9VdbLpYWilDZp+sITB8O3lBKK
	2UhOhByQu+3JOX2vSidwBC6h3lCzV0Mg4mdINXTUE00ksBH6ZG9+CCOc9/+ysYGDJFaf3Ra8Eej
	l
X-Received: by 2002:a17:902:e850:b0:24c:e6fa:2a38 with SMTP id d9443c01a7336-2516f050554mr107248815ad.25.1757350196246;
        Mon, 08 Sep 2025 09:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA+zIa0x4vuPGLZMXZtryawOhYTo5+tSCWHHkxGVO7NzqSam/ERzYOoCQyK3wKgWJuklzisg==
X-Received: by 2002:a17:902:e850:b0:24c:e6fa:2a38 with SMTP id d9443c01a7336-2516f050554mr107248415ad.25.1757350195711;
        Mon, 08 Sep 2025 09:49:55 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb28c3147sm130460655ad.73.2025.09.08.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:49:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250908015025.1301398-1-miaoqing.pan@oss.qualcomm.com>
References: <20250908015025.1301398-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix missing station power
 save configuration
Message-Id: <175735019498.347840.10113935121682584580.b4-ty@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 09:49:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ql-oORns0v9TpjrgqlnzoqaD-xYafFsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX1B0WZgDZfRFJ
 Rs3mewODa4qFlnwUJl9UA0IZGo4kfVhFhmOFN1bWP6Au0czxN1iUckejNl4Rq4W81WVm8H2+uQM
 IVtH0M4CZ0zBD3/X74jwQY/32iHbAsgGQZ+GmmgpcDZO59xNn2rKIteA0S7xWsUUSxpQ9YHJJku
 YiBninA40h1oW2b62DLEMqnBlerem+9o49rW1i9UMRloxWYBGpaaFAZ1gMJKafeRGuph2m9sWyM
 9K5ZShbviGQ4H0+eHYNkOLkrYz3KH4xXi6FBEYKoIaP2Wx6S3VOXqsEeqs+npfeuDsHqjdtTh67
 IFe6v9KRPdcEWVkqrUBA+1dVCJnVRsnkCak5FlV3RVGmQvkBvgBd+2W8tRmzcSjNwF+g1IXYfOW
 E6TB2fk5
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf0935 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JgkEKiiD5wMD4hIjs0YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ql-oORns0v9TpjrgqlnzoqaD-xYafFsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_094958_214600_59A2D171 
X-CRM114-Status: GOOD (  10.47  )
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


On Mon, 08 Sep 2025 09:50:25 +0800, Miaoqing Pan wrote:
> Commit afbab6e4e88d ("wifi: ath12k: modify ath12k_mac_op_bss_info_changed()
> for MLO") replaced the bss_info_changed() callback with vif_cfg_changed()
> and link_info_changed() to support Multi-Link Operation (MLO). As a result,
> the station power save configuration is no longer correctly applied in
> ath12k_mac_bss_info_changed().
> 
> Move the handling of 'BSS_CHANGED_PS' into ath12k_mac_op_vif_cfg_changed()
> to align with the updated callback structure introduced for MLO, ensuring
> proper power-save behavior for station interfaces.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix missing station power save configuration
      commit: 4b66d18918f8e4d85e51974a9e3ce9abad5c7c3d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



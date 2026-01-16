Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09780D4A5E6
	for <ath12k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=; b=ep8uCxgYzvn6yqGEsytfzY987n
	FWOKw0YAgmGnqrbhxL05JB040stUciCJZl98MKoRdVMdYsGYI9FglSES/ucht//PjPRmTFgU6hRLi
	asfzZWHGn7jQy5SswlmEV6ncXrMaMJ+2UGEOTzwrwmyfjB5DasyP2lmGq3vu8lE+7DkM+7A4iYBKZ
	4KayZckxhk3Lrf5qh5gxfDDZwUu+WBiyW/Ck5jtwTYMWAsSFrEZ0H3SmzbHCdOmoisknAx8Vkyn48
	oGX5tZymJJp9yXg2eke+RFAx/nywQMyoDrPqg3amyxdwAyJDEp119e7ZS+r7QIzwMRpnM37iS+kY/
	h5KRRmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcM-0000000DQ7x-3DIh;
	Fri, 16 Jan 2026 01:27:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc4-0000000DQ0X-3sI1
	for ath12k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMchBu4100638
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=; b=niopzYqj7qyrGD18
	K4Bn20x+YUCKazivETYRG1v6MGvo9W6uppS4phla4WJFV0gS1lx3reNB31XU3JWK
	5Um5iI2OoBVJqTyD6mqk+kXatYE21agkhgyVLbd7G4auLWNUpq7CNkNjXeJOvxIg
	dKemaGVNDxBSAYJY4kYQqhIQN6Kn2QZbFhkbU+eQJiXKVUbfWJldGWBpFjYLwe5c
	Kj+JqaI8lciAowY/vUvTUj0EXDxUydKtMyKGC5EJq7qYixeJPiSjdgVmyIGdu35x
	lqeTAQxPAdmstGFSgOFuZ/p/8GdAo5G2+30UHjdey+u9vtkncmSa00gjGEeEWdWc
	OfDTOw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9750aud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6b823d819so786081eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526816; x=1769131616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=;
        b=c9v3lD27KLP7v0S37KPpsooaM4JJ5uWvK89drD5ZLNlV3IZ41xihjy9fCjK/59jDTW
         T+246SAKXg+dTj2d9Aa0D702qYLyqu/ClMcQRt7gp/utskjSeLO9x9at77p8vMmScc6q
         t96X9S5IHdzGJVcBMC6DalfsYzuGEjVcxXZmOxpOCZnbhFWrLbxX/jvE4tgZplGq5Jd+
         9pPDNUw38wEGUMfWitm/pPUrwnOS441svfqTCwPBuELXHWaWUv2o40QVdonClKq4AIVJ
         +a7SVCD+F12MLjVuRJRg0QGzYYvOhmbgBEiUhRpPWDwbqCwHkA2iHED4nJJMAQUUr4S2
         E+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526816; x=1769131616;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88rACB5TJZg2guiiJgrgY/2HQRCAqkBXUr1eDvH9nho=;
        b=X1C9aXlrPD8rRx0kTHFKbA7bOLVUcKyw8JDP/WEGzMjoY7nr+6KaWD+bq163yDt3qF
         TQ6BQ1kmCqCndMfeH5IV9cCulbMWkkgk8mRMR0dIJrK61/hT8nsHJ/9UI3HdGl6zhiW2
         6pfLOn27PKJ7ObJkF9hxQVLfe6sAJW8GbWT9GSThtPYVzPjwKWT5hX1srtACevvlzdsN
         65Ux+yXD1Ip3+z1jpk6WA81wFPkXkXR+MJbEViCFMJK9YuVf8rPn2P17j8lHQM2NyMFu
         wSZkwqzhTxOuNDzNIL3R2SXVAzE8GKzXXXy/LnRsYgqCHH4RK0dnNWn5buY2JTubqn6Y
         EuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV44fgn4rLUAlKm3TyDHwZKvOQf9ryvzHOBW70WsWC3Lsqe2c1kcoSfn+1KP+E9dl8dsU+rAkc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7+m5q/ma00uJ6JYqDjZq0PdZIWAFg/18Gzke8xylaE0BfPYY0
	TV8X8+Pej67b2vzk0y6DWURwtmgl0vWRTrCK+sok2iqRj/Oe70HPU9YNHvvEJTs5lHPysEgB4o7
	t4/o6ASjPxXuXammSNXXUbQED1OVjqEPc8bdIZzzwCkd9nmmCi58yTdJnn8YWqKXj
X-Gm-Gg: AY/fxX6+lplFTDqguR/Mf85G4fk8iw65dSLCa0JVd52YpTpXEKTnE7MLMg7iOc43ZBQ
	CFX4jCi9blrhj/RJ9FIB4X3PIq6aANyI3mnp+SHqckMpTQ6rjstN7Dkhu8jUaRZ9GxXPTXlxPTS
	4l7hhvT8LzCy1sKXiPveAokM1CzHyXlDYDKmnqwdt1ya2sSW1/ZrHz/YIGMUfU3Ggkqw7SnYIbV
	Y+78NZl6spSsoXE/0kHTCIAb4brcOpJSO/lMNJm8F+kafmP0oQAxkNYhVKOKlEV5qDQ93kDJ/vK
	hBYa+q0fBQ+K4dwNpPwyTKZUBw2GxJQEZ4YAp9b52+8U3gwcGoPmj7JNC6BLrdIFmJHL1ka0rRY
	B2yl+umpa/gcJKhnnWQlAlz9AanTPsxqA/8lFJ0DLF3FrI7b8ikO5II9/LKMQ1diZ
X-Received: by 2002:a05:7300:3b05:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2b6b3f300b3mr1322030eec.15.1768526815876;
        Thu, 15 Jan 2026 17:26:55 -0800 (PST)
X-Received: by 2002:a05:7300:3b05:b0:2a4:3593:9692 with SMTP id 5a478bee46e88-2b6b3f300b3mr1322016eec.15.1768526815193;
        Thu, 15 Jan 2026 17:26:55 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:54 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in
 ath12k_dp_setup()
Message-Id: <176852681459.1143034.3213517841557777716.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX3YxJYQdSj0zC
 EnF2r7aAFEi2fSeCzi714nh9+r9S5fTZ36SMRKSsRQs7BSoPsbQC2TNzDAlJVCflpD1GfgppJHC
 8wzpk3qxVNgzOZEpKKU3gYPSs9iLBh2wilP12k8fM4ug3aBzHZ6U7aEJyJvrGYvPk5GNWsIn/oT
 uk8CoUSTOJrWvNziZ51sj5KwiXCHPgk6hkqjRuf+C7lPGOADbPm3wk3l6koCpd3jViHss1pxMM6
 C2SlSNhllYzv86qkSk3P91WdrIyu6igFeBi2sspaekqaL29UgbbxGopuP9Z052NFUt3vz4IxAzi
 Qj8waUkmSV+BiJUhLf/EBxtMJ1H+7ICYA89EuNF8kLDjIWiyxP+ab417LGKDXUuDkidWOElpXPX
 kRiObRnzjz1YsWNdS00GCMXllkXFbOOJFPSjO/OEg491oEG4EHNOubjQLFLtQTQihwG+7w9lSUD
 PBAiZPUJFTknp77t9Qg==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=696993e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6YG70U5JATtl4AP3FOAA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: J4dP9UJCTj9rseXjo9q5lgMWYyoOfDaQ
X-Proofpoint-ORIG-GUID: J4dP9UJCTj9rseXjo9q5lgMWYyoOfDaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_172656_967318_654A0E1D 
X-CRM114-Status: UNSURE (   7.01  )
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


On Thu, 18 Dec 2025 10:44:20 +0300, Dan Carpenter wrote:
> Destroy the rhash_tbl before returning the error code.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: clean up on error in ath12k_dp_setup()
      commit: 40feb23c726369700918b9c35db987f9fe3c6498

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31244FD5316
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 09:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GxG3pB/mEMcn1PbbMxa3ws5zcQTcFmJ7Cf607s7J2E=; b=oxLP3k/2eLk986Hnh5J4G9OmqW
	42PrjL6X6Acu3qbfMBy2Myj9h8kdUpdAUEw42kZfwoI6MzUlM0ByKANm54vtEA7hCM89V8WhcSr+C
	STOr7ZJGD/Ju+LARdYtPJ0qWxjn9WfcS3nQwzrA8raUZa2m4AxwPVzyRoJmZlXJH+InTHrZLAh/ck
	cBhipHJismODhcOGrOQDYuo7lpHx8dIbGTn27R6lSwOf8OZv3fHhtfMsuJrU+j83W4F9wpUr+kEmC
	prKH8gDXA+yanCKbhuzGuldZObbYkuF9eUsPGYw5MlHedlF98X32aE0K98zokN/nVJCx0yjfu8LF2
	r01TrlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvu3Q-000000085XH-3s6A;
	Fri, 27 Feb 2026 09:22:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvu3O-000000085Uy-2j79
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 09:22:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so1803282f8f.1
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772184152; x=1772788952; darn=lists.infradead.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GxG3pB/mEMcn1PbbMxa3ws5zcQTcFmJ7Cf607s7J2E=;
        b=lwteRt6fUMvR4nVepizd6PKOyM3ZEHF3hA7k6m8+xPPDP1scm31q1HtvyPof01vXK2
         Puz2AHo5/mZaHkppcZMquL4FP2trP37XNlCDyAXqu4iML2up7k5Hf+7mk/0WGE7cVdNC
         v4FE0COm9PN7crdtUmig2j9nallMC2uOioL4o3S1wLBO8LBAB4wxiWJUutI7Wlk61VoM
         j4MalriHQCYvEDy1pvOAHWYdgnGkbPrKhNpir7pR7r+STnSyJ4JN432/kwdlMWwNrdWO
         97k0DK658VcZzZRKGNxtZazF55QfmdpfhcbJUfv23xFqJfbz/7BB7ramdKxtA32+UanN
         RsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184152; x=1772788952;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2GxG3pB/mEMcn1PbbMxa3ws5zcQTcFmJ7Cf607s7J2E=;
        b=MEsNiWYSQA2Zhvb0qyJK6XWErQt6Xf84PdJVCn2x2wdXzdY0LoTNPvfgV8qVtPuItT
         1RV5a6ixD8UUoptho59US7JBYLIdpXglZLOhfmeRvVzUtlDfXg/MTn48blCP8YWrGHK1
         Fm7GKCimjQP+RYjvCCFWFKnot5e7TvlK4XYnda1c1l6vqqU2w7Y3ugIPiOkERn693mQ/
         LlYrju9VSgqBF8sG6dDaqyLxXWUnY5WGrS1OjmgXtg6m2d1GKqqHbHwK5mKvqN3SVQOj
         Uv4rFtdHEaX9bGQcjMkJxDzaTVUuEZmw51wF3tDBubYZnEkwo63Lm24AGwOtJf+r64Mk
         p4tA==
X-Forwarded-Encrypted: i=1; AJvYcCX2se1IiyXsAlytQCRStiGlYLuJcn8uAOIus4X0QxtzF8XmO39LR5/OmDhGctfzzdlc7Lq3XQA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+0k413Pjh0x5f1ef+hkGSM9pZcQVZgRFvkT3bDAP2kY+JhTUd
	fxyRnGOGJIWG7CFT5UjJwtZ1qd6V6HBzgpG7PSOdhuKfsWQzuq21+kLCByFhig==
X-Gm-Gg: ATEYQzy+v6KJtaPECMliVv0hW12w/XeQyG2dhJ982aKfkA/GZ/2INBI6My2fXCmZ6JS
	ubYrtFz0SmJ5vp0x7JwI6TobA/3qBrltv8vK0jzPXvIdI7sNT8jz8qSaod+0NB+WymLDgP/uo41
	6XlqICvd+oqlofRSsBFpzAEmvXNAozoV6OnVxJpa8buWremvTOFjNRxKDOeKWBzON3uWiyN3xCd
	5hUFpCitlCT/oBCOPKSdo0wp4uMuByCyrXdDCNpkdQSvUKRpr7w4eFuFrnRGwR8w5MHDd/uy978
	3t8VV6aV1ud1+XARHHUVpJtk4X71BzhKkcFdoTTYFGeLbSmY47gQpzgUS4gaMMKaAkIiC/O6ZmE
	kjhw2K0N7X7+lQ9B/bPk3EPIQUrhpcv5VNgMkzQpCaIqlVp22GBb4lfBNDgLCsTDq3cqANknWaZ
	hPUNFtdpaY3+NuSXAQ63J7jydf8M7qBJ2VZZPWiZa4XQ==
X-Received: by 2002:a05:6000:2890:b0:435:bbd7:18d8 with SMTP id ffacd0b85a97d-4399de14ab6mr3477874f8f.17.1772184152079;
        Fri, 27 Feb 2026 01:22:32 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f8e5sm6130897f8f.4.2026.02.27.01.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:22:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 10:22:31 +0100
Message-Id: <DGPMUNZ4ZBY8.181RAQTQN7UT8@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>,
 <ath12k@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] wifi: ath12k: avoid dynamic alloc when parsing
 wmi tb
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226165517.1899045-1-nico.escande@gmail.com>
 <20260226165517.1899045-2-nico.escande@gmail.com>
 <34974936-e75c-42db-9516-496e685d3dad@oss.qualcomm.com>
In-Reply-To: <34974936-e75c-42db-9516-496e685d3dad@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_012234_693043_262608CC 
X-CRM114-Status: UNSURE (   9.18  )
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

On Fri Feb 27, 2026 at 4:18 AM CET, Baochen Qiang wrote:
[...]
>> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wirele=
ss/ath/ath12k/core.h
>> index 990934ec92fc..378573a100e8 100644
>> --- a/drivers/net/wireless/ath/ath12k/core.h
>> +++ b/drivers/net/wireless/ath/ath12k/core.h
>> @@ -19,6 +19,7 @@
>>  #include <linux/average.h>
>>  #include <linux/of.h>
>>  #include <linux/rhashtable.h>
>> +#include <linux/percpu.h>
>>  #include "qmi.h"
>>  #include "htc.h"
>>  #include "wmi.h"
>> @@ -934,6 +935,7 @@ struct ath12k_base {
>>  	struct device *dev;
>>  	struct ath12k_qmi qmi;
>>  	struct ath12k_wmi_base wmi_ab;
>> +	void __percpu *wmi_tb;
>
> instead of allocating it per device, how about making it global and alloc=
ating once when
> loading driver. This way we may save some memory in case where more than =
one devices get
> probed?
Yes I can do that.

I'll wait a few days to see if there's more feedback from you guys and I po=
st
something more polished then. And I'll probably post something for ATH11K, =
it
seems to have the same pattern.

Thx for the review


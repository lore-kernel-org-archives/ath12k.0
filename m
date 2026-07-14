Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02958C4450B
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=; b=GnfHCKOfOacJm4LR4m2bDlaKMG
	SJWgGZQoZnED13Ofjzcdrpby84ZjqO6RMNEs1hhoA9eK3qf3cpiz5q9dG6ylwLJKAZ3qeOAOa3ht8
	GBk7xZAZ7fyNS7qUTOHRbblBEITQ8w63w5QXHsiTx+rdSpDo+plI6wtJGoASBd6K0OQ7OwI1+dFnW
	qqm7WdddtoEA9qq72rKcZzFSAJS30KWONTpOy8KhtaGxlWMu6koBOxwx/KSsDuVgqO2O7I5Xnjo7v
	fd1M2UDmsiPuoHL6nMZWMc8tUxMvbblX63qmg1lZ+o95qEA8VgCxiEdDocWhrL6rOg6YMJt8GQ442
	exBWWlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXs-0000000Cq5K-2yHa;
	Tue, 14 Jul 2026 18:07:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhXq-0000000Cq45-2Ss1
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:07:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uL9975506
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=; b=UytwnRh6KqgcC0lX
	KVGpRsB9qhja5Pg/BP9NgoFaytz8mPapShHcJlC0SRunomtbZiZpaD4IHreOwo9o
	TX0/eecIZhw3bn/YXX03e4wgmUtBTnoanopd8p7ypsq3nVvGwC4I1FVAUK+5kGe8
	QDZEebQ/R31Om/+TnVNu6vaw5sQqfIa/HM6vsR3jU6t6FEZgVr9fqHkekbK7XQqA
	ZPtNErVYUgcUyekFBlev86QhT//iQuEz9ppHr2mZqmTnlamyDYfFxwKHUHB6G7vV
	4JWYFP0NT3idKhWnscKE12eqlOOud7vW2C9D0WCrFIjpjZB3Lj5bq2FxiuMD0rQF
	3WuzFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2k8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:07:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92da6f3cc81so229245585a.2
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052469; x=1784657269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=;
        b=ZAlZrMskwh6Z0hG/yuXnHPCfkYvSJjSPgTcbKA0yqemZvSgCBDGXTea2st1DLfRE3r
         oVjId8iYL4RR8zNCES8FpGHD2IwoLuWJXJU6RkkfCfHEBZgf39lhnpVifIKSOdzy0lH3
         UvYjrY9s73FkmVC+MznEYgUCC2clENqJhh62U8WYYOCMia3g4M+4CnbCbZlUfazk8a/R
         tRSJF0ZDoWTEteWVzYK6u6QI91Mf1UxSGLcwlLIACn7otE9zznuSwqZE5fOpPINEYcRP
         yDcnp+U6v7qVlRX+M/xUiiDLsABAvGLdYvVWYyuFy1dwEejBqp9zFJhr8GCrsxmUBXSV
         L2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052469; x=1784657269;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cKztgpSNjz3WKUCSrKkFj0FRV10LmHOvE5zYzFACW8=;
        b=rTKBz3bonIKveyHIAjMftdBBN3Jj1k0h8eYsRrXvjiPUwKmyYO6LyOVbfu/T6lTByV
         POCMBztQPuaShcOkRoJ58cj+lEJnfkxa32m1Cv3skPENq90doebZLtHq0cnBQ9TRewF1
         9MMuKZqGXsQYD7IXEJnu/nc9ixq7IuP0IzI7PoUL3F10FO6V4oDg1mgrfJuew/achGJF
         U/vJixoNlTfYs4PfVIT2hTEwQXQqamAn22wCsjtTt0L4dzCq0kkByAEt36SFB9443dRM
         +BWU8/UPnGP+Ksdya1+VTh9nybKeQnp7iXJU0oC5QeXD5zYWy8xYGNz2ksBJCPt7JDnn
         1qlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod/BQ37JawNMMxvm81Kt+W4mDxta+8DsL5Sm41LL76ckA9pT4+wyZOwG7zq/R7hWF7Z/D+Kh4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZmHL7wUZk5hC7I6TQ6i8X6VRm58slQHlAbWw7MjoNwiowjsN
	OWUJjWtrROp3bNsUMiOfyenCgl5kJgxFJsH9u/W3xauZFOTPlKBc2p8sap3dBKf405guEJViOiF
	zVklUx6f7YKVGLuJdpiamavK51OCxgCid3AheqwCdyXi1L+BfhtkoZ6qkJIGeeAgw
X-Gm-Gg: AfdE7cmYRJB6Q27qi/fS/bnvNRKQy54ac4IjaYNBVltnDBPKNJ6e0Vm3uzSp04yTjDX
	89EwbamKKSr/xF2hXSInVBdN/nUJe9fOg/wzOkgT/vSn76LQYG4LmkiI2zGxwraUnjCs40AJiYu
	D+3ZatWSznvBAgrX13qQvBtC9VH1KdLt4obAqV5u9Ao4jGG39ac7TewGHz9vbsYMhSj4qHX1hKf
	R9zLawzDLvHwmWhCk66fvi6MfCJsEeM1+cZG5OaXp1Qcbjd0++OanH8/+L47jB39X8amgN7xHEz
	0BAZkrtHcPmNKELduLkVtfesFduxoS0EXD1otZhLbcMuRA7FFQ7dhZ0PHxxfog6SaQI79YdNxeE
	7qk96saw5hJFGHUtJ17a+Jt1tzuy/FkniTGV/R3dVBsEnkIRfx/jMViUDX85Q+PC2GA==
X-Received: by 2002:a05:620a:2601:b0:92e:e314:c9ca with SMTP id af79cd13be357-92ef2c1fa96mr1459204885a.52.1784052468821;
        Tue, 14 Jul 2026 11:07:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:92e:e314:c9ca with SMTP id af79cd13be357-92ef2c1fa96mr1459196685a.52.1784052468350;
        Tue, 14 Jul 2026 11:07:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:07:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-1-sumit.garg@kernel.org>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
Subject: Re: (subset) [PATCH v9 00/14] firmware: qcom: Add OP-TEE PAS
 service support
Message-Id: <178405246411.4102418.8979771009872296240.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:07:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX0ew38BCbSaoi
 6F054lZqsYeGbw78NaF81FxzAzGBZoLOna8QpYDEnv3oCsVN0DPpayoHCYOFRBgZLAj6m9LXJdE
 thrXSl9pY9nz9vsmRs8Z72J+DgzH/l/AUseDdLzl+56GkXGJPlBmj7BH4FGpSBUTWgmuAAMp9I3
 1Ort8JelbkjgLi3qiGR21a/Lz1nbG28TwUw9W2R07rUvmGOj++HyDKRrD0PgnUfzTTXCctRXNAk
 nZzTXPBxIYQZqI+gPwoKkn3HTNytWmQXZo+ORfDSWQTs2eCEQmdOxx7rpwrt0EY9ac80EHNg0/W
 qY/b+IxPww54x+RB5/MpHRm5PR7+8j8bgGsN87ZhVAhYRCm6bArqr7Pq5oSwzpGC7k5PC8iLbD7
 lEMtICPc+oQNA1ojM7/HBlTcofSOvZOWt/yxV4R57dMCrghXHGvDLAehKzwO5CRasm5BXertgoT
 1rg/eIa5Y+V4E/1cNCw==
X-Proofpoint-GUID: c6iC_GJWiqdzirDSjfOi0cnp3zKGkPBG
X-Proofpoint-ORIG-GUID: c6iC_GJWiqdzirDSjfOi0cnp3zKGkPBG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4NyBTYWx0ZWRfX76M/Epjv7BcZ
 0MHBGaBTUbhUoxnCsev6Enkgbl1+5ed6A7IeQHW5LrJGFpSiY+E+X4dpmnROZh64agmKERIavxt
 dmKVm726PZzDoKC3YwVnG9jNwkZWGL0=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a567af5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=50BX1_4M625rkW4sIQwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110750_764915_108BDCA3 
X-CRM114-Status: UNSURE (   8.93  )
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


On Thu, 02 Jul 2026 17:28:16 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> [...]

Applied, thanks!

[12/14] wifi: ath12k: Switch to generic PAS TZ APIs
        commit: d418509383b0c884b70814ae85d3ef105a63b940

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



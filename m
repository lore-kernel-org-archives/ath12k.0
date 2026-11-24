Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D9606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1dE7923f;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZXAmANd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=; b=1dE7923f0NXltZ
	X4UuiW+p5tA5xNWVpJtAtLgBXNxrsKXtF4rvTLQBUFewiyiTM+ze4jbSp5biWuVpR20vt/z/X0qNa
	/Uhq3MXm6vlkTMAqgEtdLE0Di7fsZx6/+WgUryV088rwBs1qCtYpbHbT/tDayZrBqgDZPS6ug5HDV
	j+LhOowsnOh38weiC+AjtIQJwW6KZuLQdIGA49T1Rq/rIhyvN9U2hzq3YY6iLY/1pedRUUPXpanBK
	1hBrVZ68f9OvRJiqqdBnFGZ9X6dCJrvPL5KYGbCuhZn3/t/YGbqz4B/t4OOidl3cRNS7ztXOkhjtB
	5GMoos4YBCnjufg4xX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrV5-00000006kCe-12Cl;
	Tue, 24 Nov 2026 14:28:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrV2-00000006kBl-1cMr
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 14:28:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODB3mi1408731
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 14:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=; b=ehHEymiP2vHy9XnQ
	ME9obw6CtHFbeMT2Aw/3n6M3lSRaUO5J5xly4qxrWUub6qa6o/aDmymIFsNuD6rT
	644KKRGOjTuyAx+fISCxw5uJzuDgb3429BOIaPk5s8uvOdXZDPyIGf5v6I5yrSpS
	eG9gVyRdOpcHf/yHojuxyBpiDDGpjCk5RAvPmX2bWeNF/QXJQ2UH/KPhZ0stBiD8
	+Q/roXCceCYAKGJzSpktDc9qmshL8ojn/FiFneH7pSJax52Y4G01J7aA9SwOoIlG
	s4sH3UhufW4ODC3m8EcaIln+HSmK1V1JJPL6M8nKYx8fIf1NBfGrXRsu4TGJXOla
	Of08Xw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b800d5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 14:27:59 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67de1a8a5e7so8076344d50.2
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530479; x=1796135279; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=ZZXAmANd9uy1b762kfhABciEEjCy5nJrNlOGMUDZFI9qd3jZeMwnl+LgZVuoIlG1nX
         X+b5+BIukq4gHJS4VzEoQFu0ic7ckgkFqBHOYZoMlFKjkjJ8g4XOvHFKaeMJWESmA/p1
         EWH6Rftv9DEny5/tQFIsOjzQGJU5pS6Bvdbywd+kE+v6vmzRdvSms8d9imLZ+kbafzQo
         eYmhM+lYIUpVH/UNSGC70R7qqx+bm/kPmJWxeijuzeojlVveyBnTEnNUiDg1yMqQ0ERH
         nP8STldT6BwUD6ip+xjLBCr2u4p8zcr1nsgShXgZx6sVM1zJcK5eL8JnB8/Ar5uWlqim
         htgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530479; x=1796135279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=g+U1NqCWIHV/mK7uoO8apmY/L8imD9RleVQT8lMl/DzbZXrKEDRDE0GaK2RDM3z30A
         /wcg72nEo/yP8GfEgGSFjTKZpwGIMRh29Bb4lhFf5or3JJnHDkftT4i1OXe24e58Vl1l
         4Qfu8XqbqGXNo4pHXFn4ndfUwdeNDRXZhU/eHYrdcQuXhrwDIzo17A1B0IJZz2ypGAsW
         lsQG56J/uEHt/5FCMbDkrpTqxTJ4ZSxo7ydF/8tsMFZ2KK6Z00m5NlKq1t/NBzm07Qiy
         bm7IQqR0lwmSXnVjattDx5Vr/CYmiBNfSbTSI5BwtT1kDrA/8bp3fv2hBJ8Em1QxReR9
         cxdQ==
X-Forwarded-Encrypted: i=1; AL+hErFR79Q3+GnzCl6DyfXT0S1wb1bojCTo1PSKEckHjMzRkl44uc1ZQsv91mWGn+sJ7xcahzCM5h0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/9uCoMS8RsngMBsqV6dswoV8yt33OGb4nBWlPOFepSQYYEOPCL
	arroyfz9qVLw2S2RgjACK0qfyWF0npIL1SdiKep/h1yPYyI1gMo253YJyR3RmETCd4lVpZfJnlG
	YuwTaEzRKuxRxUq15yfVagcblIQdA97824QlNJ7ptyTHdsLLl5LrNTzfEZ+SQZNYm
X-Gm-Gg: AZFdTZfXV82rpkqvpG5Rqh6V8qWSzDsO8vuylzeSdCPmgGkSa7ztofo2og52fygUlk+
	TSmHRSOKSkxl0EJIZlfTT6u193NcvAi2nDvRSVlXC1UScpAlsL99C2JvGlXqim1V80qp9GMnoXl
	pIoYQvnKCZVvC9DUwa5ReEQlYoCsEY44rmJ9ikgQWP1kgbxA52l50zfEq4RNw2sDSkueCMo0M7m
	dgvYXA/2W57F6PqmiKeXQ/lrvqR7BofEMbiH9YZhnCNowUkqP9xyebeCeoxyprNn7YGVOThoOqA
	jT3XT07jV99GBHZJqaUKDvccuP7mqGzWbGapwOz+Op31BOrSCPGFtBcHhVuZAbUQwd4/7umS0M+
	Zc2vGMsxEr6gyXMVNU3bZFNIgeKKmE3DZ/smN0ZiP8PqGZ7BMNMe2qv1vopq7YIOwQpJ4S+Fda/
	A29I7FD8U13masW31lLMTJLRxVJKK7+ulWlw==
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067704d50.78.1795530478715;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067679d50.78.1795530478139;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33554b5sm7035521d50.13.2026.11.24.06.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:27:57 -0800 (PST)
Message-ID: <748d38da-fb00-4f76-9b58-87ad0fe9b770@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 06:27:53 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
 <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
 <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX1DVljXY92AYP
 AcXj66++uW0aIut/WynDsr24lErJ2mAs569q4pXgF4xB8LKtriemwcfUb9jj7POjUrscmSOErBc
 YRcjdBSMaZvNoPiDVjmNbuL+Wy/oJny1wPt2Sv0ENHtKO9sA4GzJ6QcYystdJD/4D0KzZqGPCBP
 30Ax757todOEp1+taRj9iQIO9GuHg3QlmB8toIR93xP/N5rinqLjHwvASHjdcQPWbFEwaSeb7lp
 HfRc5BFHoUxz5XrTllaZnyZBKRqgnUk6VFdcA+AhpN3+/FKpUCtplygnWerXyn2wcU0WOVLD/O7
 9XRdNwbwleRusUcnX3+a+SGYTasYUgZk2Ru27x82NV0Kl9E4CqtELEnsS82ycY2OwL6CjJZKTVe
 Tc/Igx2paRRvHClrV085LhQvWUB5sU/3oVidGHf7M+w1PxoNO9KWuJ8w0AR65/mYtKFkGF+WYR7
 vjM4d927HvVTOhfYoqQ==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b059eef cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UQl-3I4BsUNNjRoNwgMA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: KkbDRFddBU_T2pFZiSGI4GvcWt8pDGqy
X-Proofpoint-GUID: KkbDRFddBU_T2pFZiSGI4GvcWt8pDGqy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXxxcrNiYRcEti
 LtCJO8HAprXVJ4bmd2Xrc3VUo5eWc82bwBklJlY2ts6J7jVSl3VMLS++/zPB9/U/vNwe5EmE45T
 pmJXCGWrTeIOrzyzYIi6uJCZLgKEh1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_062800_543962_FE9FE7E9 
X-CRM114-Status: GOOD (  12.39  )
X-Spam-Score: -1.5 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/2026 7:59 AM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:54, Jeff Johnson wrote:
>> Specifically for the DT issue, the original version of this series vetted
>> internally did have a patch to add the device in the PCI registration table,
>> but it was decided to drop it from this patchset when posting to public. We
>> can also drop the DT patch until the point the PCI registration comes.
> 
> Still does not explain why do we want bindings without users...
Concur, and I've asked him to drop the DT change until the series that
introduces the user.

/jeff


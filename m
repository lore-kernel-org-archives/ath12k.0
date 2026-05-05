Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784F1CD3442
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=; b=jTQLSDtWn34+nO4LReO4Du6Mdi
	JZqH2+AM7wSpZsjyr5UUb4i5xgmrdlkQiHWODKk+D8e68C6GRQn4Z1TCEYObVzvWwioscL2kJK2SZ
	krWFZiDJ/QvwRDofmjGO8bNX/Te0VqpIAkMVuUg9xKE8HXSnKOKF0WBX0C2XueBdkId6Q/1W4Tcho
	exheUpwDQaJ0QsEDn0YxU5gLe8JqRq0Zo8Z1lH1houuxpEynh93XWNAsRVFsa6Xzrl7R8Kgm6ay6F
	yx3xndbw3GgqFnATVbftJeJ6OzmB3qFuZrmMFmzXjAH4DmOvDGyAbeygwOvo/Xsj+1yvqOyY/jqM2
	sBDLdsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH6B-0000000GZFG-0ikR;
	Tue, 05 May 2026 14:50:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH68-0000000GZBK-2myC
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:50:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645EJvDp911975
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 14:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=; b=l/9FEifzdbjK9Knf
	VYMr3kcwzNNLhbAzkKvw0GYs2OJ7sGEeOZWHWKf0cK+obbOnyvKMJDrIQJ8lgoHV
	XU/JcwvsxKjYVEKjIGZuOVpxLX4NZmGktmosZokNx+YJqslTQBCiGGl9BCYdMXNE
	crE7L0LpAeXm5vmofh7Uggtr3DCHMeTSJtLFDz6DF2o4nJfDx6jsKCqBo1yrq0Jy
	rqamtvs6nhXmQIdnBDGtNhhFEDzHZ0fsjdc6/iAFVW2wmae8RcSCd8kJi5+jxz5F
	c8fmALkBNzOLw+891xaprdQssFDUYsd3Hx7I5HqJ9STd75ldyI54mKNtTm1wzK9E
	wtw6lQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jg4s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 14:50:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1309f4ee96dso2949034c88.1
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777992607; x=1778597407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=;
        b=jED8OiZr6HgTVxjZGaUNcxlb5iKiJAMnhIsINUV7H5GwAaOLqf0DFvYO85wTGW+ySc
         8c567sgw7utkReKL+3xKcvVtHGouIOCXWFXVeLZcuZnKHUCx9dgTMuw4zZbWY2Yh6A9H
         9ZdEgVog6X7dw8cJ6gxi8fqKJ4wfglM48jUdSMOc17fbqUt/P/B92g+F6SWln5W9e9hc
         tx7L7FZvXDChJWYjz4q5qeSNKBndrSRxq2u/+EtFOl23bfWDU9OL7jX0rnMmZOdNntc8
         EY2qDaTU96yQm+uRh4BOj2Mh91yKxv0nsoWpr6MTeuswZjfFGVRAFhfs8apLZyucluIz
         2yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992607; x=1778597407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBSnO8fLfv2V7HIGkj9CawV0Uw7GLfZNqY6E6hFC104=;
        b=sJNRAYoa2me36heRNn4MNvLKLloBgQmapkmBEYyU1oN/TFV2bIyFj6xuj4HDElctEZ
         dNiqdjR7ve82LEFdb2LntIFkJzRiAEpoVifjkM3NIF8SA/7K8Lxxjhf580bHeEwBnLK9
         hnSyu/jMmpjKx0MkWwfIlwftB2TgyMfjvJd2bJaM0Qwrsmoes1+VBzEGq2Sz2u7aLMWk
         iC2hfDaB6NeBfaRX/upHdYjOXd8GnI7sD7DNEGUIEd+AD2zp+RHyZ8U1e2wkDAIQm0Z0
         ezZJ0paw24YUpKoBwkSfr8kpONvLyicbWRGPRd1nVCcEHpfBVP9g2VZabGXJWAg5KfsE
         Mg6g==
X-Forwarded-Encrypted: i=1; AFNElJ8oG9HZHlNi1yJlbz6G/lWd9Bxq2MqNj/bV+vOrthB93ZzZuFVTSrDyHZwDGhyWNPj6pYKVgFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAkTfH7KDup7amE3M3ZbQ80w8KTZ1FqOaf+9tdMO5t6SE0ZtYq
	8PH7N9ezOjdGbu+SSkQjQf1hB9+DPXWmA0BOGSz7T3OHr5MHkxmGwKXkPhAk9dsz3f0PjvmROMQ
	3VzIWbldpMJqNFnp83BczOpY0hcErPub27/bPNDi0OB9W4zEGB7i8aUl6K639SVS8
X-Gm-Gg: AeBDietXvkxbwwriKRywmKCJuJeAUk8nV+bxLV+9kloffm//EgFiczHMOcnyiKO8WxW
	71u7+PI1HPvKR120c14Oz1Sfmn91D/cU1gs+26U/sNJQ1ELWAOE8/ljZCSISAwM4nbuflOQHd1v
	6q0lh14m6nKi+2ZML02ywRcCav36T2AyiijdQCRvsGyZO6CcLa92FvxsMktR+SH3mvQviegwsGs
	BmOx/cMgY6Z1/arN/P06u6jHlfdRDVPX1HijITtwU8r3TsidHOrHQvrWAnpwievIhBoCwhUrFHI
	enYMZw6WN25orbvPr9r7neFM+M/SA2VdpWm2csEGzzV+xXdNxGVmeD9hD7WQnLmPdfZjt1eUsgG
	iJoLNqbRcbU3SyHhSkavSYuvaT9pf430XDIAWBGwPppARv7X3cjDVv+SvZ2JR7HJwACFIqZuKf6
	V0lWEpCcpP/7iMWI2i
X-Received: by 2002:a05:7022:6628:b0:122:33e:6d41 with SMTP id a92af1059eb24-12dfd84327fmr6504988c88.23.1777992607387;
        Tue, 05 May 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6628:b0:122:33e:6d41 with SMTP id a92af1059eb24-12dfd84327fmr6504928c88.23.1777992606769;
        Tue, 05 May 2026 07:50:06 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8279e57sm19149584c88.3.2026.05.05.07.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:50:05 -0700 (PDT)
Message-ID: <ae68bdb3-d683-4e7a-a27f-739214656ce2@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:50:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
 <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0MSBTYWx0ZWRfX3CplOH8riZ5t
 zCSWyHyAR1x0UkkO0WMw5Y5lFDMuQqDsLr6AiYILaNb/7qEq/61TM4LO16PdlvhRsHSKIsoo993
 8Q8RvtFy31Gcx1M29x7O7U8CA+MFeXnT7DejqUu6Y4qkCXx0H6hRC9Nl27Tjn0WXqCY0ysstCs0
 sGpHDmIJHqKyCkAX20+cWQAFMujcEHqSpuOBdYP0e/FzwjBvgMnMtY8hr4RME1eCrWG4pszx4to
 2BSFefnKr7yQwEY0PFhBYoS1o2my13dlqdVqPLj8sWiOomTWzutGq3ln1fp5b5C3s/ZCp+ER5mV
 T516WNUTSy02fFcBVX7eSPYxIZDO8wGCjpGoE4XeZk3J6G36mUsk6YLMaFkVXmaMQP7oYPIeudd
 mWEouoJ+TlJCiTdOHbxFPAQ4yjYdy/UjJm95zT5BD1yV/qLGzGwSemJ0Hgc5c3qi0ET1x9m9eIF
 p0QogBGC4ytbyYwiA1Q==
X-Proofpoint-GUID: urSNID8JoVzlh63zLpd53S_Acc8y2S94
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fa03a0 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VMT16xk1LGalzlQIQqAA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: urSNID8JoVzlh63zLpd53S_Acc8y2S94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_075008_795386_AE9215F8 
X-CRM114-Status: GOOD (  11.32  )
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

On 5/5/2026 7:27 AM, Jeff Johnson wrote:
> On 5/4/2026 6:06 AM, Sumit Garg wrote:
>> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>>  			 ATH12K_AHB_UPD_SWID;
>>  		/* Release the firmware */
>> -		ret = qcom_scm_pas_shutdown(pasid);
>> +		ret = qcom_pas_shutdown(pasid);
>>  		if (ret)
>> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
>> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
>>  				   ab_ahb->userpd_id);
> 
> at some point the "ret" param was dropped, and this now generates build warnings
The 'ret' param was dropped by:
8fb66931fe31 ("wifi: ath12k: Enable IPQ5424 WiFi device support")

Not sure if that was on purpose or accidental. Sowmiya?

-       if (ret)
-               ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
-                          ab_ahb->userpd_id, ret);
...
+               if (ret)
+                       ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+                                  ab_ahb->userpd_id);






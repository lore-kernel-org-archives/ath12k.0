Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA8FC79FBB
	for <ath12k@archiver.kernel.org>; Thu, 10 Sep 2026 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6Rrg7E4ekU2UrwXZDAmFlaZnGNaCD77Yu/KxI37yXo=; b=ESav7x2SQO7S9Y+vbPyEsBJ4z3
	1yEdOSzps5tQfwgnBd4Wn9UJTPoJ5CoIVY1FJLw7A/OeuZwBYHOCtUWEYUW3BBrzazWDmnBtx8VXI
	KypqbnFE8fAnEY5jvbUjL9H30S2Xm33G2HgSBg0S8R3XjCPb6zhf8THxr1fBjX9EOCm33Sa8MXWnm
	eMILUUoC4iQn7jIgRnlIwFfgKsegWi8cYGBZCqXJ2FhwzsxcTvXt32djI7QdBHwxZijp9kANK6sfN
	PGhCkYMwzZt6AF2ywR75e2T+Yn4Yzw0UWptyWUxzSaJWDN4kSaXYsa8xj8CEkatrnUsqNd84nIh8v
	r2sfxb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mNA-0000000FQKz-0HWN;
	Thu, 10 Sep 2026 21:31:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mN8-0000000FQKW-0PNI
	for ath12k@lists.infradead.org;
	Thu, 10 Sep 2026 21:31:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTTDe1466687
	for <ath12k@lists.infradead.org>; Thu, 10 Sep 2026 21:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6Rrg7E4ekU2UrwXZDAmFlaZnGNaCD77Yu/KxI37yXo=; b=eGwqbwFBlCtFob7Y
	dHRIgjtDxLQMLr/jSPWvgl+Q+LjRFyrSv1oOpbN2YK7Nsyb8tTf0rMQjePxXAl4i
	lbLU0ALlNrUo+lsf58zT+MDg0wScPgLzA73bbYPCPn3AAsMq2cSssXBIWvF1q0PH
	VBEz/AT8HzmGPTLladcWqaB5bpxSBHQ0J3enuHeJaI+uAIbHk8BujceCBpUvHAAC
	zZ0n2oj8ancDSarSVflzYeVJ7bF4aYTmByAimKgH8HKupG334l4Va0UxBjXJV6Xs
	l656A/NqoHe8XVtjMLoshgO5AhKEXGXcIGdPmo3WUFLeUAE91u2oFkQn6S1qAxDz
	bluHcA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdnbef3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Sep 2026 21:31:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc132709c76so337397a12.3
        for <ath12k@lists.infradead.org>; Thu, 10 Sep 2026 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789075913; x=1789680713; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6Rrg7E4ekU2UrwXZDAmFlaZnGNaCD77Yu/KxI37yXo=;
        b=WjG4bsFO81A+Qb4gQKdjMfMN6bu0etNmDzx/ew/finFPiY4MTfWaTzdff4nw6406OZ
         7EkAi8kp2GL+5l4YeUQWYOTPCG9lSSrjXo1Cc8ZZYJ7OSFmNoyQN79TM4Gf4DBX+qRKg
         mTofXXgiJS3wGUCOXqKtTuS2jmQ6OwHhCoe474slp8cod6jq7bs18l8y8OHOj3KwxStW
         lZ/1AXJTMmqwYvSWCJ9oeqHLQT+LyHR0TZXiAtERFSfcPXUjQIau4EyFe9s/7QdIDxYO
         qvHqk0R+MwJqCdJXm192LvjVPWq/deSx3MXQfA0YnycvzpvDyeIKO78uWP+4tYoJD8aw
         cI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075913; x=1789680713;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6Rrg7E4ekU2UrwXZDAmFlaZnGNaCD77Yu/KxI37yXo=;
        b=k2SaG3YMAvfRDJp3JiW8VEyJyzrvOsZg6jwxnU/K0LcKpTpQnmJdZ8l5rkYZQuwI29
         iSJLawUiwOHLcezQbxkmcQWy+JYQRN2sSIM6F0CFWB7iAmDCIsi3qOEicB6OTBJE8mLU
         G++kw6q25K8QSQWVAd5B9dVQ/o96XnxFily9OekF7Ty956njO3oqj6+PCG3sYFcvrEoD
         Gqo751bTrjZUOGrOHkJijo493g3w8Bw/jCnF3coxciXFOWgSjzyOY1gs3BBJmgTG4OwK
         NrCE1cAk/18R7uJHMvbLhqguyDg6E/hi6otO9TAEf5sJ14y+GTZLF14ed5zjYLL1kAR/
         GBLg==
X-Gm-Message-State: AFuF++kZReNVhj2O50f3C8TP+99UZQpybtyR+CnY5wtpUjN8wS04kH6r
	nHlAl4elCJ8uHGGPjPJeH8IEW3tWBeQXAde0E88cFp0XquFWc4nqmyMfzQ6rpSMwjfyOfvVoV53
	Wu+UThAEFm+0wNaUbl8yUHp5CKeiW81yMw3S2bt6Ln7Mksf7P3ZLOjT6+XdQAu4ikQv3l5eyG
X-Gm-Gg: AYBFou0yXopDMyaY1MbHiQaw9nvqhC1pkcfkCI6mg4UGw3igs5gAXknO3au3xg1NKWk
	XA/BLhCAlUDdKOKe3ZJq13FpLF1sMbF8HC5F8cPYqV3viKD5xl2K2vTp+JsWvyh9TZ5H+B6X0Yf
	jXXjoWkidheiVrWNPJIdboJaAiZ8PqUxzCB12abEVWGBKoPxaMD+vruqVusGCsVDs8WHaXgDBUT
	MeqZHaHYbVUoLgH28EU2PTE8YEjK64a5bJmVP+Jq5bRUAs5P+yFNj1Yv8uudr55zkyZwwQJvXad
	0ZGLD/+1IyBZtjKmryP4bULsYs1TTgmuQ/aODHteDtkFfFOT4kP90ywPAvtCVfNf3y43DESWQfF
	O1Ae8baAQCUL6BXQJhRbCmcBGSPlnJc+J4M5KFffMHmGkiXq9M3UZ5WE=
X-Received: by 2002:a05:6a20:9191:b0:3d3:aec2:4dcb with SMTP id adf61e73a8af0-3daed3c163emr1483710637.23.1789075912876;
        Thu, 10 Sep 2026 14:31:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:9191:b0:3d3:aec2:4dcb with SMTP id adf61e73a8af0-3daed3c163emr1483644637.23.1789075912367;
        Thu, 10 Sep 2026 14:31:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f0feaasm845733eec.21.2026.09.10.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:31:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
In-Reply-To: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: add support to load shared
 firmware on multiPD
Message-Id: <178907591083.684897.6314733930806411528.b4-ty@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:31:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI2OCBTYWx0ZWRfX0/J96abdUp1G
 MpAcM2qQ3PCwee5gimAaBGCx/SZ++89esF8+ccX/nuE9jVE4jE6IECd61DyOtIyMKVshRjEsmBm
 +mVpmcOqZrMQH6hG8Tq+OGu7Emx9kXdskxJFYpHuZHXEB2I6vdjaxtOfgnlYaAY7SMAzptUqaO+
 DLAL8oNVe/qmSdjrHSfqea6T3l3T4+l/pNgD9+P53v9a7uTo3DmQp5Dq7ScuM0qfw0cjRAzbcF2
 7PEpeJkNjwePH7vtiBTdhNiGtIWaYHG3/91I+r7xQsZf/4J5QkJtoQK00jwG/qou4h0hTdCrB/e
 rWVeKhbDEtX7L3KXRfuM7uETorivi5FJqm3llAilaM8GYLqwlNZiRo4kjU/3NP3l1mffDWy2vVT
 zwMpK5M78CZ7mv1X5birBiFwU4m4YX7lNdJrSR/9svx6TouaX+F1nyBU3pMQjMtsM6+SzEiQMjx
 rfQkIRcIbE3Qtk5QC7w==
X-Proofpoint-GUID: OJDUtMJ2hK_Rx5_6eFSvqFSpBQRLEiBv
X-Proofpoint-ORIG-GUID: OJDUtMJ2hK_Rx5_6eFSvqFSpBQRLEiBv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI2OCBTYWx0ZWRfX3+vzq8Ga46Hz
 zR5Bc9PX2RoEkbUDmXiSEyXzDXcvW8iaCYb3oCVAhkG1wS3ST86IcZkZOIOtngW//El6gLEhsDU
 lF6mMXqL5OhEzgMuqzbjY/s7IHu5HVw=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa321c9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143154_175179_B009D2EF 
X-CRM114-Status: GOOD (  10.70  )
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


On Tue, 11 Aug 2026 11:13:16 +0530, Aaradhana Sahu wrote:
> IPQ5332 platform uses a MultiPD architecture where multiple firmware
> instances share common read-only code segments. The driver currently
> loads only the per-UserPD firmware, which leaves the shared read-only
> firmware unloaded.
> 
> Add support for loading the shared read-only firmware once before the
> UserPDs are powered up. The shared segment contains common code that is
> identical across all UserPDs and reduces the total firmware memory
> requirement.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add support to load shared firmware on multiPD
      commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA0606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gya4suFo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npZ2q1o8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bHQ6iYLS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fKwZ/jMpWs5LEClj5iWjtZCttmhZn3kqRT+IeJHl0oE=; b=Gya4suFoIfVdDY
	ekWpqhCU9wdWAyCdy2lZFTjM9qYkp2K2icBut/i8Rs6ZWm6PiPSmUKtDXtx2F30VSFF8Vf7xL8/21
	6+qNm3InoupVaSJ3SxRReBPeijCMeEMSuj7PTvBJGtIBnq52TMUl+Bwqgb20GQkp9GWpZe6QQ3q/x
	ljN3vIPAInPC1la29ExiZj1gujvO261pZo9hAglNM73rUiUtKv+AGO/mAqlimu3sjMwYeydDV1HbD
	pzqFODOykzbotC4lXiUWjSdEWmdOrbrAFwonwdxzW7aGEbM9fj0DpRC8PiKr8vgd7HMjaMuwlRbCY
	DdzI0ErR9uT4CDJBPHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1s-00000009f33-0MNa;
	Wed, 18 Nov 2026 17:01:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1k-00000009evZ-2IiY
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:01:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwiMf199908
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKwZ/jMpWs5LEClj5iWjtZCttmhZn3kqRT+IeJHl0oE=; b=npZ2q1o8JJaqMPbT
	26xiwAoE2d8U9Y1rbzs2UFGsFA95Vr3AmgOQofk3qDhvOZ38S/PWdzZltYpkGim8
	PMla7IQcHzOC6WYIINMNwYx3mv1VvJDMd4yQe0b6eRY2JL5hVTQmf45B7KURzzsb
	4qfiNI2zLxM4TZT4jyhZnXv5OBVXekSsmJHWBzQ9l+dymcqzpsE/JaCrAMIXatMq
	5MLjNE09+qdlqkUykpJ2RghQ6TJFB0pRqIqo7VpVjko0U5HRq3wR+NkGCVRzrrzF
	uXGGCa3SJAiMx+Ia6C6LATP99ca9EC7Puy56fdWLfPJayJE5faj8hq/sAOLrd+Pn
	pphNwQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9c6yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b238436265so949164c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021255; x=1795626055; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKwZ/jMpWs5LEClj5iWjtZCttmhZn3kqRT+IeJHl0oE=;
        b=bHQ6iYLStwZGuEYSngrHo066/pJL78kZphW+gnG26CjS5AQahv3VMRKSHBIDmYANdN
         orZ2um4iVQaf2S6X5RQiJEGCdUtoYaAfHqx6flg0iVJSJl6Ups1FainYdOQpM2gOiHPT
         EaHZCAxycyElKWpw81YVAzbJw7xeUBKxIqVD1FIvW0MZllIGf2Clovhqb7Z6qaX2qp/D
         UQmSqQxapEmTu/XTkYGQ/u8FTFzbliSm+Xh8ATqaFya4YNuVqQb4J8Axo95PUprtOQXz
         s/8O3K5YyycNqucUOP8OolKkH6ImWYJehsrYaQdSV2IX7o+lov3ged70g2JsaGJ/6e23
         nanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021255; x=1795626055;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKwZ/jMpWs5LEClj5iWjtZCttmhZn3kqRT+IeJHl0oE=;
        b=QFNXivAWjKiRKACXRYEacBT2IjnU7ZHqIHQaUnYMtAY0fUTYHhZnj3B50gDctLxHAY
         YvlbyGvc4wPYknX5YGiNcHml/0FNKjI6ua/0Q3qcEVwR4IcX+hGDtMoNtLKgRmgkg455
         qGdeiabwTdldEmGayPzcMWiN6+bO+MCQ6yDUUiJjOFXpTopdSXTBDbwtfBokLJX1M205
         Q6EdEuhvfQYkQuorTbmB9rjB+mW8IjXa+UCHYBfOqsNPQbYX+73VFfCqynIEG/P8bNdf
         dDbtkT+dXneGtoow+3t+cGZKenBVrmMtyfi39OnCnDRVsHYy0nuUUqdPIZ/S79I7i201
         61kg==
X-Gm-Message-State: APuU4Z9md1TVzkUawIysyq8wEvTZaC4EWwOFkLo1d16wAR2+FG1AsFnn
	ig9GaqVJ3mO1ziCrew1u0XZBnSZAbaRJjb0v5qnVR1ojCu5TUfHjSv7Nlzr1LQpYVKBC22VC7NO
	KIYrlNBaSrkvSzOWFpNtlIT6MqxnNh3grp/lvobwSbANSbkY5ux+fmkl6jUc4TpeNMXgIAeM6
X-Gm-Gg: AYBFou3bTy1luK/aHkAXbK2Bc5/Ca+nnmV+hp4lO2zFvQtpQ/TNsNmYbXbV7WEMK8Md
	LjV8e7PvTufPXjLNBq1IRtuLDyReQmF2t7/kaYdYSq0INReALENZrUiwlhcdRVoTlgk6OY3wYD3
	kSAL2h2i1mMGcGx6Gc6aU6wQk4JqjK2vwac3cBo8cMVgiSmfX5Rle/4Wl9/Dr0TTlmq9wm9CpZS
	ObCdaylIkwpmsYggbapTooAUKaak3qGHNYZ1i0uCH02URLjg5Lg33aSwGNJlz44JtL9Cfdch6Yk
	hIeOWA55Xk6KaPy6pvZ/805YbuQpeLC+mbMQFL9HbUUIrHrV8gJ7dCazQbBt/3ngugiMb+6/skf
	ogytg+YCxBYtdC2D8+0SGqdbTaCmhzXP3sego1J4juRQDjxHxJBBeSUtVL1rore3TEtXTor8kpk
	eLu0ikqp0pbY0mB434VqZ4WIRuF5aS
X-Received: by 2002:a05:701a:ccce:10b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b543cb50c5mr2644897c88.10.1795021254298;
        Wed, 18 Nov 2026 09:00:54 -0800 (PST)
X-Received: by 2002:a05:701a:ccce:10b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b543cb50c5mr2644855c88.10.1795021253424;
        Wed, 18 Nov 2026 09:00:53 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.09.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:00:51 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Yingying Tang <yingying.tang@oss.qualcomm.com>
Cc: yintang@qti.qualcomm.com
In-Reply-To: <20261118095353.3064776-1-yingying.tang@oss.qualcomm.com>
References: <20261118095353.3064776-1-yingying.tang@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Yingying Tang
Message-Id: <179502125166.3425953.14251168147911200182.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:00:51 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfXyRYywKhdrLSx
 T/yhFy4b0+KmrAS2q3C8G0nZy4pqa9jJrEYCmv/NWWUPwnhiUgeK9/tBImvKVFFttQ0eVS/Pwvz
 gG4q5s7k/0NTdfHFs3RrB+1AZ6Vo9Cg=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afdd9c7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=stOmr0AUdo6i44lH82wA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfXzolx9+OsrGxn
 1ICDLutW0eyyUOJ5dM2vH4sqP8uMW1H/7NXblEADxWJ2otVTML9M6qi+mcwl2FdSPDhfbXY63rR
 o5/MZQdLcG3RBLhoWWGOuaXKFgYcS2B1S3cWcK4BFVQLX72elzvXymr6tDKsNzSAHQDiaV0SM1Z
 PJ+govypSbR3zbA1aMxzKHSBngsBmV+cO7QlhZ1daH//kYc2U85Rg0WpmOTw20K9EGgaxfEgVjR
 mEs9JAN8KIbSfqUC0L7hdlwf6tCVxCtw7qxuR1eABDLFehhuXNWffb3dDc5BEUGcFucfR1mrD7F
 5GVS1rxmn2G3la9GcFUQpo/q31MKpYQTQMI+kpkJTZbXGYFWMGkPExhOOt9zrqFpfOAWOBVzeD0
 rFk1LI8bNvyOErCLswgf+JurcUvfeiOXOizVq0BO6vzwrgZ0fJhdnxOogmQ4VEVsDJETMOhzFZo
 y70haD5Fb4EV4PBU4hQ==
X-Proofpoint-ORIG-GUID: aBBPi6GSJvGf0OMO09CWtGafpd2AgB0m
X-Proofpoint-GUID: aBBPi6GSJvGf0OMO09CWtGafpd2AgB0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090059_102046_385A5E90 
X-CRM114-Status: UNSURE (   6.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 18 Nov 2026 01:53:53 -0800, Yingying Tang wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for Yingying Tang
      commit: ac66eb7717e7fbfbcf9f25268c650f2291d83d3d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



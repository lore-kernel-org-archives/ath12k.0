Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B5AFD9E0A
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 21:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i41LecPOfJlxUTAd1CxctSLP1z3s9+uc5PK8POH9+cM=; b=XKGQ3fLh8GFdVBjFMBmUkpx41f
	ubheH31UVR4mfTOLy/dbBm71o1A7Oyldxvr4NGAb8fVcAWiNwcde4X1apJ+2kjVrLs9mIOQofqC4V
	qkoj9dxR3z2R4nZ1alF3dDajcNPMzIj86onJRIvDPg35DJHpycWJRvwvO5q4Vt8eX+9WP/tgk/RUY
	26ij4/lPmJaa7CiVhVRvmdlbgAIX2PMdk186tavGRRiRjOJWxcYRAxPSHm5d9qr3beeP52v0CbVgK
	13Iqy2YwKJMM9z/Od3yvxTIx3hRJwTGldJgFPmN8g1+iMRkpFLWQos/9DZou+h1YnaSEyP3b9N/+A
	BdYurFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviv8-00000007FNz-2rHm;
	Thu, 26 Feb 2026 21:29:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviv6-00000007FN0-1PgZ
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 21:29:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEZNi452265
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 21:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i41LecPOfJlxUTAd1CxctSLP1z3s9+uc5PK8POH9+cM=; b=pKZT+2Ut+p/NqQFx
	qE57mKPM47T5exFxy7KmC6sC4bS15UZuil3vhBIDVXi9DC8YtqFWEwVfii5bbh+v
	ThQOejz0YSWHWVC7Ts8WNj1imPyNsIyFJ3/Le+hjtR4g0FThTLN8WefkiSFh5bKK
	/1pYFENzgb3t4SEf3YDG9Xki7HKXFPk6OlWme4FXNpgPLxl393PZ3qhDOpGH/ZqV
	aOFFnMMYrciKWsSn0HEFiJYPfSKrS6HcMi6ABSIiJsSbKD5d/jZqRlh+QabqduHl
	apC8bJSA2JZmaiOq303TGYUsIKq7VMNzVQ4xuNN7vT7uGfEBFq7HqhH+NpEG4mZP
	xlMWtQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99s2ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 21:29:15 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4ee07e31dso34217726a34.0
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 13:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772141355; x=1772746155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i41LecPOfJlxUTAd1CxctSLP1z3s9+uc5PK8POH9+cM=;
        b=MLJ7AmGdU47r26uHH18Or2gieZvt6iCg8r36U5VrgqsJv3MDJQQDV28oU7M7F3nW7d
         o/8+n6UBCvkL2Y3lwVJQkYKVTQKBi3j0d1SszsEFsXjvxQ6Xyj3CmksrVanHsuu1SMUt
         Rj1JJGNJNE/JQYUEPptHO2qF+QEY2yblP9evf9BTU951DQQ01bdb34gShCVRPSsAyX6B
         MJzvoqzLfMON2K6bBhzk9IYXmRsjllDIWjhkP6R2hY14Sjt6ISZITHg+UnE5bsgMqpk2
         wNJSYz8nCP+bRO5p6cNoHgFPWdWb1bVbV+IyTjavPZhrNmQqPCc98eYsgvWzMVJ31U7T
         CEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141355; x=1772746155;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i41LecPOfJlxUTAd1CxctSLP1z3s9+uc5PK8POH9+cM=;
        b=lUQAKQIV9WEi49/ggYW0koq2VQduPh3Db0ej7gK68E1Ts5PzPm9Scsyf1zesiC7Ug5
         wiofncaZ0TwxFN5xF6s+fQQeeuQte23pD7s8kBGl0uohwkAAgMHvzMcOnZTQjO5oD3dk
         n2Q2XlIou7aigzzlxGtbi3OL3+fAkjQp8FcJRFmXJNnhEaKt/UracogTMIArDbt/LjEQ
         7zLli5aNK8s9+3G+Jq+s9rj+ThjadeuQ5A6zYgUvUt7jw/xIU/VTKKMojLUdkmR1EUeR
         08zO7GRVVY7LD1jz0pLQM0vFgbqF7G9+dKuH8pOQWwcvWz0eiwEeZdKpUzilno1/k6Me
         ZMzg==
X-Gm-Message-State: AOJu0YztCah7ZwOe7UV3DbIc1PbNohowJ4NP8pm0c871xA5qfXhDdBJ0
	ABJ27MFh2HdOhcqboqEwpFe6geG9DlsPW3CpQRELw1dJ9+kPltJ5Eh2lqp9uKAIYXT+w1G5+scm
	l7699cWIiVV2+Hz0gIImwWdUH8gaqdLDLYQFngtFejkcspjMUSO+4deeiGsRInQF8
X-Gm-Gg: ATEYQzyVaq7GFnUTmLoBjhnOlYL4pIqv6/IxVGz7JdGZCtdh/8aM0VpCywDhmCkGe9O
	JC0QJPCC846/9qFkPxg3a/aDlGKA3zRM1oAqX+/5TzXFaNkHSy7CP6hrhQQUnqhwTRond3RYCXx
	nRpJRsqiEmZOX5HXjLJ0obUE7Enr0ad7IbNOKz6tU8a2QeF57IB/WeW/wuKphqS3Jkt5tV6Kdta
	hNHaZBTbjrW33q3f85lvQwRQP8bH6DKEQdWD4HVumwA2FEbtx7nKXlFIFO96YP1GZ72nsK7uT6w
	GdtsV9+3ACtZsGeCpR85sQuZC6jwAfRsQIkGjtFLei6XSAIpIjuEY+/QsSnVlleK5s9Z+FlXC59
	UgwGLFDuqcWpjkiI7jdLoxt6MSOmc0v66OmE/xP1lIt+1AeN8OnJYspPBqaJ4r7mLWieZg5m1As
	kx
X-Received: by 2002:a05:6830:2b0e:b0:7d4:c471:c221 with SMTP id 46e09a7af769-7d585760234mr2465044a34.10.1772141355262;
        Thu, 26 Feb 2026 13:29:15 -0800 (PST)
X-Received: by 2002:a05:6830:2b0e:b0:7d4:c471:c221 with SMTP id 46e09a7af769-7d585760234mr2465033a34.10.1772141354906;
        Thu, 26 Feb 2026 13:29:14 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58666ed17sm2866703a34.27.2026.02.26.13.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 13:29:14 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v4] wifi: ath12k: add basic hwmon temperature
 reporting
Message-Id: <177214135345.1298720.2239590933156720521.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 13:29:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a0bb2b cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=b3XROT7bV-so0M2aTt4A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: 3MxUw-WoWMxm-DWeT0AVoyeaeRDEtSF7
X-Proofpoint-ORIG-GUID: 3MxUw-WoWMxm-DWeT0AVoyeaeRDEtSF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE5NiBTYWx0ZWRfXxItKQtifvkk2
 1E3EtNeKQTXwDg3TLDZtsr+5fMhmk+SmZ12HG94WZHR4mty7VP91iB01xw6mKHTFpFvDzDl02JW
 HtkMC4jKOABFERn4YMgSqbtsv40hsIPguO0og+kVSO4/RJSjea4hb3gqJR4NeZhyCV5CcwnHLyM
 DeQPdjLaj2J+05h0pX0/GOIEiEpIlwxdOK1uJC8EUW33v+hgacrgpMVmaHit3mJeiRUUk2t002c
 9eK6ccMbR3yggOYms74TVUIjGmb7g/3Nuo2zTjSBE/g6XcCp4SZrVdW94I3LfJld/t9iSt8tDmw
 TGmyg5bSAF+UJBoMX/NVM875DIit0mHbVjXtep7C/8epdfwvyrUasl6vYZ34mG649FSGwaFjNrg
 4NKlDspewrVkdU7u6QWsv06sHG6/gvKJAiBL8Cryr5QCV2nkRCff/+ZykwOBjkRkVyhyYvWMfOn
 nO0arHT9PH1Vq4Jo7vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132916_379280_6B607ABC 
X-CRM114-Status: UNSURE (   8.82  )
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


On Mon, 23 Feb 2026 18:56:22 +0530, Maharaja Kennadyrajan wrote:
> Add initial thermal support by wiring up a per-radio (pdev) hwmon temperature
> sensor backed by the existing WMI pdev temperature command and event.
> When userspace reads the sysfs file temp1_input, the driver sends
> WMI_PDEV_GET_TEMPERATURE_CMDID (tag WMI_TAG_PDEV_GET_TEMPERATURE_CMD) and waits
> for the corresponding WMI_PDEV_TEMPERATURE_EVENTID
> (tag WMI_TAG_PDEV_TEMPERATURE_EVENT) to get the temperature and pdev_id.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add basic hwmon temperature reporting
      commit: 151322bccdbdb132f5a73cc8ad5d3ab89b90ed52

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



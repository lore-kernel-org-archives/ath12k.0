Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17F9C44523
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJcL3N561TAVp2yc7eeHH+8jSCw9USDs3Feimog58g0=; b=kbj/NJ1bfs3PuyrECu//XPhaR3
	RwLuiKFUZ8nQ7poLi/HwqSBoI1DGHrdJqYwS49XV1ZTl5XZtR+/QhcHNa4ATYqM1tKdKAV3oyM5IO
	3Kbg3yHPpJM8+uQQc1r0xB+NcwYMEeGM5hVJ5sRMqxa3E8UM6pU0V18cBwzdrmENKrDJ2kJCnGaPl
	fHJvKnnn6wEtv40HZx9edj5ZooiYKMrdqK0QPAciBYnpv5RzLEmHNv0kEHzET5wnz+MT/kqoJJua8
	jh0WcsmqLABBAzm8P3FXeyBhlm3bTKv2sILGp+CF/BCZUL/2lV/yPG2KAdo5dQkNgAGWyehn0NIaw
	38PIczFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8i-00000002YUZ-2m85;
	Fri, 17 Jul 2026 15:06:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8f-00000002YRe-1aqW
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 15:06:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7mim2186970
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJcL3N561TAVp2yc7eeHH+8jSCw9USDs3Feimog58g0=; b=lxhJAgZVsx6vF3b9
	Cd63YcX8OJkdPXnmzo4gHD12TJKtWe2AsG0cfULa+paG0RYu4E74hpcTFUclj/8a
	IchjLwC+1LT7Z/4qLXvyLe45J6MoC6fdbb6c/4LsO8ZZnBWFG+xMg/KNbG9AqiQP
	yq2/Kl22Lr7TA4ly81k/Ga+Oc7RYQI3jBlekrjeqwO6a077EICjyN2+2t/P06fEI
	gHD2VV0t10MUTj2SVSeSmltpyZ4gi8K/eY6p3/PG5I1VcUHvRBxFeG1NhTOEXiBu
	b/3Yw9L5mwe3oyDUvMZCxcf7vFnaljbv9VC7Kde5PX5gsE64ao3yS5/nKw6YENgK
	DHRLlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3atd2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so4640128a91.0
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300768; x=1784905568; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJcL3N561TAVp2yc7eeHH+8jSCw9USDs3Feimog58g0=;
        b=X0LYeJ4E/17VVQm86xHfRkDCXiGZLxW6dkoOWW3oK6yABJNGhLmS6Q4cFKAqSRxmCj
         Fy7TMGsSC3JQntpKHjDiDnp50Uz5u3/9NvyrSQJ5UwVvY4KEwn5+LYqG5jg9VxeLE1Vj
         8aiguMYwMpsKVH8EbWoBzWFWa/GLYKhKwEiEPpmxaYD0w2o4ovo3CDeNwU4Doxia288z
         Fzu+oWpRC1mvJGe/sBWaHmzXJVe4gHwbrsLu9ioyPpR7dQ1Qgp8SRXG0+C8OT8dOKj48
         iWpaoTsqQm8SzGW2E19Ck8Fi1SDaVhYcCCJBu5VARh9rDfb4+EDlPKj9p0geq3T3bDb5
         boLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300768; x=1784905568;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJcL3N561TAVp2yc7eeHH+8jSCw9USDs3Feimog58g0=;
        b=QfqQLop64uE0MgkppKrUXOVVc7i1fj3mG0Ky82ZiuLDp9BZSNXn6w7iDmlDBraKTzu
         ZuYgkYberZTUbMctGHcvLf/U+uHFxI1SzESHn07/7+f+RimD+v+CDat7EJ/hhAUwqksE
         nIgs9wI9OM1L0czVG6MHpHJ6PXdSjeUs9S8zVikahl+mwT1jhmyFNMeERsZvFGIDJgYu
         l1it0MxidrnfyAjS6JpFDZ7Pb7fJ0A2pOlOSa0GNHGOJ6Ycc4vrFZDEtwvsdRn1a2tgc
         b/zsD5kquA7wkxDJo0PMlFtfbNgi5JtAyJQ5cXSS3Vd+8UUK9TWQkH9loPDH4Q2HD1P4
         b9oA==
X-Forwarded-Encrypted: i=1; AHgh+RoUxUjFREBCgTlYvmOqRXZDUF0v7bal/x0ycs3Zl948IN1Tstf126xXcoPP2PR3ufjZ3lv+MDs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBUpiH6xRYUnR+LBhBdvQArYwK/6D+OCHyNZBdx+sUq4nuA3AV
	wGp3fJ7rKneR/Et+Ys3hrR7OUauHJLtTPjzK6f+tJw/wuzOG6tBujJiVbLh88y2bp/UZDAkLEIQ
	YX3zfvdjcs0iBMMdr7dAgCZ/zDIO/ul5BW8uaR4CoJ/nwhtKxCeswjsYKoeMcPz9GA8r80VzC
X-Gm-Gg: AfdE7cn+i4BCyPbUw8gidpeX3iJ/hpQ/pwuyy1QL3y+Ycqk2krW+YjTmDy8q+IKrCoc
	TGNLS1/mKRORhknpVi0tGc41l1x6QFwIHr0d8f8UG42UpLKzje/igNSWjiiuAbrDq9ujYc0xNZS
	JWXKPH8UK+LBqzZVfRyXYn+lstH+R8eUo6haAKBk+1SMlDAczA7c1SvTvex9OGYk36mHMCQlMQj
	2Qw42403yi8tDuKgz5d2TynQt4WO2ZIRddxg5BUaTa2BYQkZ1N09EhKifbOSOfwRG6rZqlxOasy
	4zp/ynWw/QR1Fq4KpGpy+Yk1Eev3mouoHQjccuX4lO/b0+wm7++Lm4sBy/+S0dMLt5yRhGDbD8Y
	NamOxInzoUIr3C74+14CCrwc3UkFWQ8fWo4d/hfQ5bLK1AKxF/Z+BiWw=
X-Received: by 2002:a17:90b:2e0b:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e4b54c1d9mr3463127a91.34.1784300768107;
        Fri, 17 Jul 2026 08:06:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e4b54c1d9mr3463097a91.34.1784300767715;
        Fri, 17 Jul 2026 08:06:07 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
References: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix scan command endianness on big
 endian
Message-Id: <178430076679.128359.14484292801513582946.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX2tCoJFz8x3tI
 Z93rktBsmjJ4ep/6fLY161lmeZR7DvyVJ/lqdszzQtlVcrVSAdpDGqStzn7o5J2iezYrP2+P6vw
 2q4ZCVpNUuE6VpSvCxEp72623xaupY8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfXwCqYS70Q0fwh
 MXjrODooaUp5a7mi1ivlul3C5eqZ+fuXl5KHuuR4mGVGjn1qulF8/83pfCWlhNJEFU7Ala8MbM9
 NC8MxI+6Yd+9WBp3DbKXfRgK3JlpJWM+AqUovdrBQGFcalVJC388wO8uu6YZa0T8Crl/dbkiiUd
 UOBUlzUzot7fdtEX6wmbdHkA2FF6XNR8pFKvFIZOnEwGWzU7L9oHQ+scNVEUvbfuLHDdDFo0mzr
 7sj2U/5jfvCBZEk4AUaCJKJ2M+9sKuMfCFBiuweBSgePIwfEfaM/0+9hx8csr/p6GCBpMEReFy/
 +hWZ33Qx7vAHp9rQMP8jBFnRIHF50BxqcWk2omZn6j4FDlIFN5lJ9Eihe/hKytz9CpzmgXKurJD
 lxB6UA/veh7m6fHvZsbHTZaCd7jS5TStw7tW9I2talLPShCYmb6Th8FaV0zhziL6ELSoLa9pZNU
 xgJOwzBJ1pu7WPYDSQQ==
X-Proofpoint-GUID: YwYNZd4QMgNlAjqgbf0kWZUiPDZGRGlu
X-Proofpoint-ORIG-GUID: YwYNZd4QMgNlAjqgbf0kWZUiPDZGRGlu
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a5a44e0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eT-IiUoY1iDqEzW4f9EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080609_426605_147703DE 
X-CRM114-Status: UNSURE (   8.35  )
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


On Fri, 03 Jul 2026 09:35:38 +0200, Alexander Wilhelm wrote:
> ath12k_wmi_scan_req_arg stores scan parameters in CPU-native byte order,
> while ath12k_wmi_send_scan_start_cmd() writes them into a WMI command
> buffer whose contents must be in little-endian format. The existing code
> copies the channel list and writes s_ssid and hint_bssid related values to
> the command buffer without endian conversion. As a result, scan requests
> contain invalid parameters on big-endian systems and fail.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix scan command endianness on big endian
      commit: 8e3d6b596453c518a7ebdef2c785550c5e291dc0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



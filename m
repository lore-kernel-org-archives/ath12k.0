Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EACC43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7t+uhAr4n6UmJjPAB/Y2zDizxoBpf31JurKCJxnvW8=; b=lSQ/wqePmznx+vvzI0a+iJOj0z
	CUoeyOsx0T3QKzmpYA3c8ve5DA4eBF9z65O78GSEblR4hbMMoTUJX/6JYA9nEuXk6xmNVBv3gtxWF
	LmXZ3Aai2ASA3yMWNz5P8KK4h14SCI+CxG0f8KqT5kBlcEc3nDFwNTsAoDhKKV/JE+OZUio56x44M
	uzkOH5gqQIHkmHazYaYia8Fm2EVGwRkXXBjfQho14pbXUEIyyJEQ16LtD6DKNV8UQa5B810ta7TW3
	1xb4PQwoCRPknZnPWnLwaOyZbPrzHxnPZh4MdYWjCfWNQZBUKcikAiVm95JuieeLsVr2Efi8eOT+n
	bJ25wOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyK-00000000Ejo-2Q2A;
	Tue, 30 Jun 2026 21:26:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyH-00000000Ej0-1lcJ
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDmiX2937291
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7t+uhAr4n6UmJjPAB/Y2zDizxoBpf31JurKCJxnvW8=; b=e5QRvE4kRpZTPdTv
	c2/KPwDfznC8KRsj2IALreL0fLb/t6s6s1Oz033c6FcLLD9FydAP9/zG7vxtDlsN
	xPx1O72BJePepOuL1/qOCqMH3j8z4b+l8YTGg1v46+L45uUvy0fgO4T/M5Id8fwi
	DDXaCDNPl9pBV+oZqSWSmaRHUSdv1cajIAsmy4lyGSJ9giZV8IGRTLXX5H+tnZ1I
	/qutCj4dHSvXJoV4BYPMuAaQAXr9tE9nBu7eHqLrJ4PmSsmMCGxEhUSxTlyc8zON
	K+JbbmQkTgpmhHD5p2xof4mdobhRTLZhUB4qW9iY13QMxdYXojJAHphyPP9p+VU3
	RpElyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0a09b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30e773699d6so3764656eec.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854779; x=1783459579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7t+uhAr4n6UmJjPAB/Y2zDizxoBpf31JurKCJxnvW8=;
        b=cMNkoXvowRqF2ODQ6V/LXieBmZLLda+G4sJeU5ULWMLKG6wOHX8/PlFmqjQU+pRBna
         kf9V0oK+BmgEfPVpBg2X3oiGQOj0eoIcPz5Qm8SJCfUVQJMErQaVFKg1oUJX42Srbyjn
         20Wkim++3Id2QpFc9/EOo1Nw+CBDvLGWlQgXu5wLnm049SyvL83bAQEH2wrDfMgShRqV
         vVin2yb24gpaHuRhDZ9F+EzJN31haAnvsas+z2aB1OdW1126Nl8AiVbKCcoezXVS5RZM
         FehaSPRxmQjZa820Ae/I91VSm4bh9m5rTkHRHrvnYs182/dDRWB/1djnRdh95idwZcG1
         Qx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854779; x=1783459579;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7t+uhAr4n6UmJjPAB/Y2zDizxoBpf31JurKCJxnvW8=;
        b=PSEYnsjWORImiqvhkh68YPyvGUwo5JUXo8TcWkzei/Tr6vWZhcqElqFXYW/Ewj7Ny9
         i0oPDjvbQXp2qfbA6++tPqnnbI4EDXM8H9uAJWcMnGevdsb9PucBRbVbtbt6ushykDno
         pcg+VLms1Q2vM7RJYmE8XCqq9/kH0hnOzU/r/YX8G0RCMfL5vKfjfBrEdi0PsHjr3faV
         Akp56KS43SS8zDIfMKb2L7UXGvycCsxmvVllCOetCi+ZgM7HGfUqnEs2P6Hy5LA3Jo9u
         IWRV1eYxO6o1H7RM71fSqI98WyegeVb85mg+RMX1efJJ2V98PuQqW25ZslWpKQWLiuSf
         5xVg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0mpUwBKrTC0WF6op+7gql02tcV7HfN5f7ojgZiHNbapY50gu4DVWNYPX0Gsmfuw3Zxo+Els0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiotMvkp1v7nfNEyjMObIfrtBJWob2pbZgqLJt6rx+aJjrx8VW
	g4Mc2AUlQYw92QiUky0KZpnx42RsktCctWRGLt7bEO2rGFmpTMbJEHdbUVOwQlpsWS/95pCO7Cn
	ed7hBu3dMuX/Zoy90V22bzXneGtH1Sez2czpBv+YXVaAKKmtUDXzO2QSeG1kagRLG
X-Gm-Gg: AfdE7clD4U38avVag3oeO5x6AY3rZ4MXT1OZeaFsW/hNqt4+gb/4EoFsKqQZXFDPIzj
	Lgapttr6l6845hfFYFnmWadkPLhWkf4Kib7xp1NwKP2xigGkV/g0KZucWcFAWqz4isTnDmGQr5Q
	WaAGGyrw4ud7ZWsNlUT7stcYZEYSgVIp4gG0q62YPY5WDQ2xiwD9FGbFPPfULYlfXcWC5zJGF7+
	3okbxclDPtkybUPOGUlMlukQ/P/1XpBwHq8xTkuvoBum17mWYRJ/+8vuF45KnSnTu6Dil9/Ld/d
	6yj0rf+Sd1Y2IjEezRDzmY61O3jlrKQ4xzGCrhMrqCia/jWcnpUd2fYRsjge9ECad6wPW4Xys/w
	786gpxPwCPFvOkXgBn//1lFZsUAYl7bsmLZWxfuXd5Fy82WO1V9vOsRkvdOWOOBtNeA==
X-Received: by 2002:a05:693c:41cc:20b0:30e:f0f2:5b88 with SMTP id 5a478bee46e88-30ef0f25d35mr1054952eec.36.1782854779379;
        Tue, 30 Jun 2026 14:26:19 -0700 (PDT)
X-Received: by 2002:a05:693c:41cc:20b0:30e:f0f2:5b88 with SMTP id 5a478bee46e88-30ef0f25d35mr1054922eec.36.1782854778785;
        Tue, 30 Jun 2026 14:26:18 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
References: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix inconsistencies in struct
 qmi_elem_info initializers
Message-Id: <178285477754.1590147.2554100101750757747.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX91Y0RRSMh2kN
 637xDfYTgpN/2ZsxbooyFX0ZA/SBNdWliBV3I5y0F85p1raU6MrNRV+A5wLlYKsF5NgOE/xWlRs
 2U9MXjSD049+U6RKrQpsUUcVfc4GDQpXRtXK59EkW0NgM3dd3a0rk0+gybKTyLGUxLzmESf00hN
 EOuzY6EQ6piCy6VmPoG/LXNfK2G6TMIsZgXs6p+2L96O4bQ4swnxHNxm/021FbX4Uru8XGFVKMW
 qgP3SN/9CoMDGfCRVE31oC9FsAzJjmFh7rvLuOHfDDckPZ3Om2VD+EHVauvXYHpv/dTTgrvtaMf
 MIOci4fkkU5spVxpYjyXcghf+erCf/5F3u0XDGdyUCelXa3hjBkfOZc3TsHD9YNtRO1T1XiRjx1
 RvnHE8zbLmPVNgo7/Y55w87HUvVjjYlUEd4/wXDIq1AWlR3c+QjeTOdyFMxuI0oNeXZERisfdby
 h+TOkaVC5GqZRBgGu1w==
X-Proofpoint-GUID: Y0IjlO4QAv0ne2Gll5ce8C62CcrRdKWh
X-Proofpoint-ORIG-GUID: Y0IjlO4QAv0ne2Gll5ce8C62CcrRdKWh
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a44347c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZoZKXFMULng3zEwbkoQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX6u6jqkzmUYW7
 Up7W6pyzWnH4bOrS0e4IEVa8CKpHAEqPlCAMzDGyjeTF/B3oopf8wACuOn5lF/8Qk6SDQhK+rg7
 fqhWnir4NC7AkGHXGZTqdU/AJrnctLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142621_606571_01DA53EC 
X-CRM114-Status: UNSURE (   9.49  )
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


On Tue, 23 Jun 2026 09:43:09 +0530, Raj Kumar Bhagat wrote:
> Currently, the struct qmi_elem_info initializers in qmi.c are inconsistent
> in how they align the assignments, with tabs being used in the majority of
> places but spaces being used in some places. In those places replace the
> spaces with tabs for consistency.
> 
> Also fix incorrect and missing terminating records in the following
> qmi_elem_info initializers:
> - qmi_wlanfw_shadow_reg_cfg_s_v01_ei[]
> - qmi_wlanfw_mem_ready_ind_msg_v01_ei[]
> - qmi_wlanfw_fw_ready_ind_msg_v01_ei[]
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix inconsistencies in struct qmi_elem_info initializers
      commit: c29d1550e166598b9ee6d48c488eec0e79f98d52

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



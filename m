Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D29606A335
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xgCKfub9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODUfRy9B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgiXEbZx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=; b=xgCKfub9d7JmUE
	g9b4OxpC0Y+NwWNgYiXPuqg/13uK+ZMfSDg8iTfU8BZZemFw2fqDL/g8a2b9be0WaiFPRIyclHbK/
	hRud+eIMoKfjQbkSolyWYpCqCORNXkxAOFDjouoHPI0I/Kzcaep6XLOZpegmRkA6+ozPsQgygY6CX
	/8F+xUlQweww//KWY/CzU3ycnmFYQmYcKn+0UjXN904MCApAvCXUw4h+qjKuayeGJOiwmAoh2abMy
	lRbqq+QAdVcEc5K5BTBvf13ouzXRPMB2poPVZv9GqBXvrsXZEJM3By37Fhsk5ZvRFV71EFp0FMvzw
	JAgE8B+7lhg+O870ragw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcX-000000079PR-3nsl;
	Tue, 24 Nov 2026 16:43:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcU-000000079Ne-3LAQ
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:43:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLK4g3267103
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=; b=ODUfRy9BadPh8exW
	pZrJb34YoXdS5s7npRtqeEpfA3k50fX/dEFyJ9C9JOk0pghPpWFcfZ0KSAZk20kn
	rfo6kZmOl37+WKZtJkrQ591Bz0CAVW73bhO0rbB4r3KDhkrJDUYOpPXXclcr9l97
	C1NvA65rk9EmEzL8xLTLrwDOUtpOvivG0hrCH6Z2/N/9+EwS+Fi3Lt+Z+532xt4H
	49xQXxQ2q/k3jqVCsgK0nT33yc6jkieuFZDLXq8ywVkM6IhPKJ+teov6pb+O3kKR
	//HGNpSFxaKeQOYvNw9p0mRbpyb5u3oloL3AOTS5lMXTY0HEGS4xCNnMz0CJHzbw
	7aUEJw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s7kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6594342eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538628; x=1796143428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=dgiXEbZx2IHi8IzzKx9zlb+uTHJrRvSvLRssRDmLbhUYcCqnjbQWgM0XgjBabgXf8t
         noHQRorFUfgzJ3j1/EOT9dC7ugRT4WefMEmlxOt7IpU65wBTfJebxxCdmj5QI5Pmz1Ik
         yMH6nsyuZ900p2BjIuXpCsWN71zl5ByKV2uAMl8DA9YQNLk2cq1Li3n/1d5fMLFbm1XO
         WfF9/EfyEgdw4kjWSePQZqxzF2ERyhaBaBf0qnw0hKpjhV/mCYnZyp54yc7OJB/NqjBB
         FtOs2NxBjsOD+4rW1mBLVtQ8r/nIpT6RQj0W6jQgyz2WTE+CPwi6IZ/aCSP28cwsZwc0
         wMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538628; x=1796143428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaAkSJGfWdT/hF3hWrkH4vMfAFvDljyPIoDVUO8O8Zk=;
        b=q0QVtUbFVUiwtVykLwkHEFEFBskDrKITk7T40chQKDlAp+5PK0zR+TsiWVxgArUHZo
         BUdgV9GnXfdZDbPQc61LJXBt4VhvkBI6xUcfa73w+pU0GGdHmN2702dFxdCX1/02Xwsj
         OQDS8BJGM2e3AN2GhVKG4/SAwlaaadrg6kDTQDAw56lqIWztlEZv3tvICv4C0CRcDNSu
         1xV8rhUfpLKp6U+7K97XJ96PJ6GbHncbRpUCF/po3z7qfh61yrx/uUeVNLKUr8441V06
         N98h/Xy+zoBg1U3KYjWBWenz34bC0Vd58xEtRMqEA1w1shHfqr9KDLUWHR98WYA4PTPT
         ucEw==
X-Forwarded-Encrypted: i=1; AL+hErEHv8y9u1J4X/vGdoi/QLmj1fFoyg4i5M6JJMPpUtU5mdQ7Ouu2a+aQIquGt7iUbf9ku+whrk0=@lists.infradead.org
X-Gm-Message-State: APuU4Z917JxYmpRzX6H7JMnAm0MwCtzIDXDRDZw/jG7UFnTGVQFyD8V6
	Or+F2LcWpltwxMPX6gWrFHdk2eZZM60xeoCqieL/r1UeY2Zm5o/EY9p4hqaoajPpWE13F+x5Gno
	MlQld0AhYj5tqNfabpOgAo0RdC2BSOZl4WtAgayg82tF9cg/azBl/F0LazObUkWlp
X-Gm-Gg: AZFdTZcp25CrXDC8+5orJCvetE7adq5Nj73et708JtvcWtVOJgUORDaVOQIRzZisaKO
	IxuaQk1jnXy+aiIo4Sqygf/kEZk13ctP8UFYeYnEov/fNCeHpPjG3G9MM6JBnts7k11MmX0dzdL
	i6nNsXsvTmaxykP8aikxCeIlMSNGQs3ZLSDNjPUtOFTodbNx8oH7ZMeyw5vqgKJpje+1aNBw8PK
	JI3WvYkSmFOe3/NqQbM66FMZRnhztioj2qzLzelegEKYWTW1RrSzImBzJRflCulQRGfoJqGpn0e
	oimFR6XSl1a2C9x+5ffA2e8D0y7FOLsaFdRtKjWKKzp40EsIfUA8FIw9Ly9JTdm3uatseDHAIXi
	zczlRj7mYpRXykVo6UT4uZphm04cawSriMgyC48cCPYq0bEABePwr7hCkCx+qH334630GaKjO1H
	7ulYevJhc3so0DY4KBlIVSXhReJvxU7bo8awh8dzNxcEisONg+ecmLBn1NM5l1uMyEvXfb6K9B5
	ck=
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr15298650eec.41.1795538628312;
        Tue, 24 Nov 2026 08:43:48 -0800 (PST)
X-Received: by 2002:a05:7301:4d18:b0:37d:bd4e:c378 with SMTP id 5a478bee46e88-3857181d8ddmr15298604eec.41.1795538627530;
        Tue, 24 Nov 2026 08:43:47 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:47 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:28 +0530
Subject: [PATCH ath-next v4 02/14] wifi: ath12k: add extended QMI WLAN cfg
 for CE and service pipes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-2-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxpHzLmcsuhs2
 IPN4KmtOPcIGVG/Pu1FHNZKtwzSq/sylxUHadG5/OwLRgaQ+ilVbUDaXf08oB9bbYaknV7sZRUo
 FdyJDuLUvENJE5Cb/Q0TaFz0Xdgc2mY=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05bec5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z7nB0JqBhXvykku2dhgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXyhuRb/ADBZJF
 Md8tqd+7APHg3vR7SYAN0P/FoVIKmWAECXxPZ6/VL6/SurjsXHAkl+UIXhBSsywJFKx0tsDZk6I
 q+x3pPC3ra8LIQd3KtJ1ukC3L2ZbiCdPRr6D4AXjWyycT7yna/uz1Q7qHthP8JO6BchUmA3KgKC
 vSH6YopYbX8a7TzhJ/hV6sj0XEYtayj5Snua5c598skUlHhHtwoGXD1Fj6ye+xemiE5WPFdEUkk
 c0yJAUihEPDzdMAmf3qzQGu1vZ02+n98lN5tU4wtFv6cxZc90ScUE55WcyeeBqtF0ArUmos69c2
 9DuYdWuFqWxeXVZQWncmMxZxZt3slc+RnuzIFRz1e1jlOf2ikQV6QejRkCKUIDPJSwt76Hyqd1k
 C2DL4yRXptoRzTS33V653c7eMUCvqfzDsa22i1JeSlbicbtkhLJW3o265OY8lK2II4aKyorTlLs
 laEvOUVsfqBHVFsDgEg==
X-Proofpoint-ORIG-GUID: Ad7mpkR4IAk2aN9Ok-MfACmnkRT3UiFd
X-Proofpoint-GUID: Ad7mpkR4IAk2aN9Ok-MfACmnkRT3UiFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084350_964030_2231F69D 
X-CRM114-Status: GOOD (  20.68  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QMI_WLANFW_WLAN_CFG_REQ_V01 carries up to 12 CE entries and 24
service-to-CE mappings in its base arrays. QCN9575 requires 13 CE
pipes, one more than the base tgt_cfg array holds. The old code set
req->tgt_cfg_len to 13 and looped up to that count while filling
req->tgt_cfg[], writing one entry past the 12-element array into the
following svc_cfg_valid/svc_cfg_len fields before the request was ever
sent. qmi_send_request() then fails outright, since the QMI encoder
rejects a VAR_LEN_ARRAY whose length exceeds its declared elem_len
(12), so the WLAN config request never reaches firmware at all.

Firmware accepts overflow entries through ext_tgt_cfg (TLV 0x1A) and
ext_svc_cfg (TLV 0x1B) in the same WLAN config request. Add the
corresponding fields to qmi_wlanfw_wlan_cfg_req_msg_v01 and extend the
QMI element-info table to encode both TLVs, so service-to-CE mappings
can also overflow into the extended array if a future target requires
more than 24. When CE or service entries exceed the base array
limits, keep the first entries in the base arrays and place the
remainder in the extended arrays, clamped to their maximum sizes to
avoid out-of-bounds writes.

If the combined base and extended arrays still cannot hold all
configured entries, fail ath12k_qmi_wlanfw_wlan_cfg_send() with
-EINVAL up front, before any request is built or sent, rather than
silently dropping the extra entries. Update
QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN from 803 to 1835 to reflect
the larger message.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 124 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h |  12 +++-
 2 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 52a925fc44ee..69512b82aa3b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2018,6 +2018,62 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_cfg_req_msg_v01_ei[] = {
 					   shadow_reg_v3),
 		.ei_array	= qmi_wlanfw_shadow_reg_v3_cfg_s_v01_ei,
 	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_CE_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_tgt_cfg),
+		.ei_array	= qmi_wlanfw_ce_tgt_pipe_cfg_s_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_valid),
+	},
+	{
+		.data_type	= QMI_DATA_LEN,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg_len),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= QMI_WLANFW_MAX_EXT_NUM_SVC_V01,
+		.elem_size	= sizeof(struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01),
+		.array_type	= VAR_LEN_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_wlanfw_wlan_cfg_req_msg_v01,
+					   ext_svc_cfg),
+		.ei_array	= qmi_wlanfw_ce_svc_pipe_cfg_s_v01_ei,
+	},
 	{
 		.data_type	= QMI_EOTI,
 		.array_type	= NO_ARRAY,
@@ -3537,10 +3593,28 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 {
 	struct qmi_wlanfw_wlan_cfg_req_msg_v01 *req;
 	struct qmi_wlanfw_wlan_cfg_resp_msg_v01 resp = {};
+	int ret = 0, pipe_num, ext_pipe_num;
 	struct ce_pipe_config *ce_cfg;
 	struct service_to_pipe *svc_cfg;
 	struct qmi_txn txn;
-	int ret = 0, pipe_num;
+
+	if (ab->qmi.ce_cfg.tgt_ce_len >
+	    QMI_WLANFW_MAX_NUM_CE_V01 + QMI_WLANFW_MAX_EXT_NUM_CE_V01) {
+		ath12k_err(ab, "CE pipe config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.tgt_ce_len,
+			   QMI_WLANFW_MAX_NUM_CE_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+		return -EINVAL;
+	}
+
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len >
+	    QMI_WLANFW_MAX_NUM_SVC_V01 + QMI_WLANFW_MAX_EXT_NUM_SVC_V01) {
+		ath12k_err(ab, "service map config has %u entries, exceeds QMI capacity of %u\n",
+			   ab->qmi.ce_cfg.svc_to_ce_map_len,
+			   QMI_WLANFW_MAX_NUM_SVC_V01 +
+			   QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+		return -EINVAL;
+	}
 
 	ce_cfg	= (struct ce_pipe_config *)ab->qmi.ce_cfg.tgt_ce;
 	svc_cfg	= (struct service_to_pipe *)ab->qmi.ce_cfg.svc_to_ce_map;
@@ -3555,8 +3629,17 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 
 	req->tgt_cfg_valid = 1;
 	/* This is number of CE configs */
-	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
-	for (pipe_num = 0; pipe_num < req->tgt_cfg_len ; pipe_num++) {
+	req->tgt_cfg_len = min_t(u32, ab->qmi.ce_cfg.tgt_ce_len,
+				 QMI_WLANFW_MAX_NUM_CE_V01);
+	if (ab->qmi.ce_cfg.tgt_ce_len > QMI_WLANFW_MAX_NUM_CE_V01) {
+		req->ext_tgt_cfg_valid = 1;
+		req->ext_tgt_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.tgt_ce_len -
+			      QMI_WLANFW_MAX_NUM_CE_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_CE_V01);
+	}
+
+	for (pipe_num = 0; pipe_num < req->tgt_cfg_len; pipe_num++) {
 		req->tgt_cfg[pipe_num].pipe_num =
 			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
 		req->tgt_cfg[pipe_num].pipe_dir =
@@ -3569,9 +3652,32 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(ce_cfg[pipe_num].flags);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_tgt_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_CE_V01 + ext_pipe_num;
+		req->ext_tgt_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(ce_cfg[pipe_num].pipenum);
+		req->ext_tgt_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(ce_cfg[pipe_num].pipedir);
+		req->ext_tgt_cfg[ext_pipe_num].nentries =
+			__le32_to_cpu(ce_cfg[pipe_num].nentries);
+		req->ext_tgt_cfg[ext_pipe_num].nbytes_max =
+			__le32_to_cpu(ce_cfg[pipe_num].nbytes_max);
+		req->ext_tgt_cfg[ext_pipe_num].flags =
+			__le32_to_cpu(ce_cfg[pipe_num].flags);
+	}
+
 	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
-	req->svc_cfg_len = ab->qmi.ce_cfg.svc_to_ce_map_len;
+	req->svc_cfg_len = min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len,
+				 QMI_WLANFW_MAX_NUM_SVC_V01);
+	if (ab->qmi.ce_cfg.svc_to_ce_map_len > QMI_WLANFW_MAX_NUM_SVC_V01) {
+		req->ext_svc_cfg_valid = 1;
+		req->ext_svc_cfg_len =
+			min_t(u32, ab->qmi.ce_cfg.svc_to_ce_map_len -
+			      QMI_WLANFW_MAX_NUM_SVC_V01,
+			      QMI_WLANFW_MAX_EXT_NUM_SVC_V01);
+	}
+
 	for (pipe_num = 0; pipe_num < req->svc_cfg_len; pipe_num++) {
 		req->svc_cfg[pipe_num].service_id =
 			__le32_to_cpu(svc_cfg[pipe_num].service_id);
@@ -3581,6 +3687,16 @@ static int ath12k_qmi_wlanfw_wlan_cfg_send(struct ath12k_base *ab)
 			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
 	}
 
+	for (ext_pipe_num = 0; ext_pipe_num < req->ext_svc_cfg_len; ext_pipe_num++) {
+		pipe_num = QMI_WLANFW_MAX_NUM_SVC_V01 + ext_pipe_num;
+		req->ext_svc_cfg[ext_pipe_num].service_id =
+			__le32_to_cpu(svc_cfg[pipe_num].service_id);
+		req->ext_svc_cfg[ext_pipe_num].pipe_dir =
+			__le32_to_cpu(svc_cfg[pipe_num].pipedir);
+		req->ext_svc_cfg[ext_pipe_num].pipe_num =
+			__le32_to_cpu(svc_cfg[pipe_num].pipenum);
+	}
+
 	/* set shadow v3 configuration */
 	if (ab->hw_params->supports_shadow_regs) {
 		req->shadow_reg_v3_valid = 1;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index ed024084cac2..7879f439a5ff 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -544,7 +544,7 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 };
 
 #define QMI_WLANFW_WLAN_MODE_REQ_MSG_V01_MAX_LEN	11
-#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		803
+#define QMI_WLANFW_WLAN_CFG_REQ_MSG_V01_MAX_LEN		1835
 #define QMI_WLANFW_WLAN_MODE_REQ_V01			0x0022
 #define QMI_WLANFW_WLAN_CFG_REQ_V01			0x0023
 #define QMI_WLANFW_MAX_STR_LEN_V01			16
@@ -552,6 +552,8 @@ struct qmi_wlanfw_aux_uc_info_resp_msg_v01 {
 #define QMI_WLANFW_MAX_NUM_SVC_V01			24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V01		24
 #define QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01		60
+#define QMI_WLANFW_MAX_EXT_NUM_CE_V01			32
+#define QMI_WLANFW_MAX_EXT_NUM_SVC_V01			32
 
 struct qmi_wlanfw_wlan_mode_req_msg_v01 {
 	u32 mode;
@@ -582,6 +584,14 @@ struct qmi_wlanfw_wlan_cfg_req_msg_v01 {
 	u32 shadow_reg_v3_len;
 	struct qmi_wlanfw_shadow_reg_v3_cfg_s_v01
 		shadow_reg_v3[QMI_WLANFW_MAX_NUM_SHADOW_REG_V3_V01];
+	u8 ext_tgt_cfg_valid;
+	u32 ext_tgt_cfg_len;
+	struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01
+			ext_tgt_cfg[QMI_WLANFW_MAX_EXT_NUM_CE_V01];
+	u8 ext_svc_cfg_valid;
+	u32 ext_svc_cfg_len;
+	struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01
+			ext_svc_cfg[QMI_WLANFW_MAX_EXT_NUM_SVC_V01];
 };
 
 struct qmi_wlanfw_wlan_cfg_resp_msg_v01 {

-- 
2.34.1



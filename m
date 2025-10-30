Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2936ACCF9EB
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 02:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txTiryi9IhAHzPUCcDKkjbgc4ZJqQxM5lfYU1LQT8C0=; b=L0dT29OVDMoU0UsDXAXNWbYDqi
	qUGEuQXlxqRNI1gXjs8VXBPgGeC0GizhhaM22ttHVtSmATewnUBvjA7LQViEGHmuA2x+W/cigXP9K
	xRrk4qdeofHeojSgUywhRRoQXP9cCLr5j2WPC3TpAcq6nHXnsz/zMAfZ41UIJC5TfETN4shlTlD94
	ll3PTHWT+BzcIsyxmzBBgshpUmwVHVQXMERh8ghL2XsG7lWlhV/GZlQqQd8EIeT/cbBqZ6J06hGCA
	SDtxrdmNbDb/QpivLOZu9wp8LVJGZfHmgDvrJB9a+//6tPuZeHyriZUIk00P94zjYPtGcIJaUcuzE
	Y+NcydUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEI66-00000003MRY-3mmi;
	Thu, 30 Oct 2025 02:09:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEI64-00000003MQz-0319
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 02:09:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TG2vMp4135571
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 02:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=txTiryi9IhAHzPUCcDKkjb
	gc4ZJqQxM5lfYU1LQT8C0=; b=oGg2nbrr49gkQTFfeAPoPwOXJNgKD9NsS9qu/e
	FRNv0T8tWdJNhpPjtzpxR0Q5i3/GI1ztYXE4NOaLgLc8HNDMPy6vq1+SsdLTzASb
	TP55mZKvoQutMOE7HuGvzPOuKLbo/DvE2ks25uGwBDWWHiH5FP0NiXWGpRuEtJIg
	A/p82MRMgIgTKYogtVPnErfsdKG9WwXM+T52Ktt3n6RiP79Ox8XGOdoKf7KWyo5o
	icGWYX9GrrHPzAYRb/dK0x+DTjFPVYxLAO/t7qYFBLPPaRdVT3eJ9nQMLYhVQKu5
	AsUNZzR3ZcJrcH4i4shsPoSAq1sudTdCDuLx6hWwQ85DUlAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9u0uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 02:09:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a27ade1e73so459743b3a.2
        for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761790141; x=1762394941; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=txTiryi9IhAHzPUCcDKkjbgc4ZJqQxM5lfYU1LQT8C0=;
        b=XPIWrZo64KhlnNeylXE6c3dJGMQDRMarhitYCEAH4+jp4hgJyXbHGS25XZmX3RSZul
         75vH17qmiLRpyObZFM4Yeh91hMxF65bCzKkF9TPT6YxeVHEDghjKynXQy86e+VzHD3YJ
         nCxrDaIammlWxYV3RI18lUVcQ8AFy8JDLS/ht0Ce7tAbk20aocpOf//u5nsXCIzDLI1k
         tPTF+ivqDvYKLashYcx6e1cJ18O5vBTm4TG7IVAmz/P0rJRclUEL4FB4LXgZhJ/9OkSt
         2DW8Vul7wPZ3QhrIIQ1kSDfEUYGkN4un507ALlgLze0vCM/QDmvsaTdmobnj3dysf3Q3
         Ph7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761790141; x=1762394941;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txTiryi9IhAHzPUCcDKkjbgc4ZJqQxM5lfYU1LQT8C0=;
        b=BNDtZiSL30GLQy5wygiaxDIbWb5n1Jj5E8222wT79d4rYC5tm4a6t2ybJxDyyVi5I0
         ttromK3BhUCa6KAwV8xweDQ7aaVMI16/FDAUCQZBwimLFJixpW1f0bTFf95SGR2RiFnq
         4Jw3nOZutV58SLhooUEYapzeJPkeDWRp9kNpdPlvrpHsOZMaAHblVkSKAPrwignK0s6C
         2/fw+Tpfp0RUWGOqxWQO+oXD+LsNiqp8r2s8SWcpjwhxi5YU11zugodyPa8B2K2kuyXE
         eTQd/zEuWXwveBlCV4O1BaA3m0GK/myO1zD4codhrJWKYstqUuYqiFiACQ7nKKSDvPZX
         zDvA==
X-Forwarded-Encrypted: i=1; AJvYcCX6y9ndfAToK18dETFm7qM2HHtX5ohcUfhYyCsXk9dolPfjfeAjgbVrSApOsMxPG9Zhcqfpxk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcCArGvw3q9nm7mbZGDHkpkGsVZv6dAUbrpYNQjleeaT29CocE
	bo8vmFivAXelxRuK2T6551PdIYF93LNxEU8KYqsf5IkcauRZxRXYv8Dy6EO4gP6Gwj6UN81CyRm
	P40zrCo9CIb+mS8m+HDfE/vRXBy3GJ+D5kwpfrmOdaUuew6ZZh4AyLIOj/ghDndyWR3a+HBkl
X-Gm-Gg: ASbGnctUW4hlJwIEd65DGWHod6alhqLw0I3gF3Y7XwM/btk8O1vkUaX4+gGDzmqI3Tz
	ukO18VAOAu6j/JK0M1XDjFVyXBrjYrMHx/cFhKev4qpZ4M3cM9FoDZdeMiDnF9PcnbMfBZe82zr
	VlJtk9OG6MDE9ksNLps0iJoHwO4MDsKnt5s1J7vVERjGv0w2Y1uknBAjSw+chnENya1NJDZ2yXT
	1DSj5cdADtOj+y/jKQXJRaVO+QhwSaGU0B+kvr644J99278O79JGtku1KWTKijDqis7zwyPks9m
	ixWD865HVlqBmEMGqI0KeK3HMO2lXrMPhGcOZ7zTUGU6eWeln40f8FvOGPm5f0HAC9dxaVp6iOf
	TZFd/Ox04kq7G4dkEQJknieQMu6msWeP31RzeeMSX6p6iRcKTYt+K
X-Received: by 2002:a05:6a00:84a:b0:7a2:50c5:64e8 with SMTP id d2e1a72fcca58-7a4e4e12aebmr4820888b3a.23.1761790141319;
        Wed, 29 Oct 2025 19:09:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHmgeapjx0QflJejJC5uG1l2QuXj3wQa6orQ0sWPzjfQno7ofwPjEYQ1924atN+a/PbBmlHw==
X-Received: by 2002:a05:6a00:84a:b0:7a2:50c5:64e8 with SMTP id d2e1a72fcca58-7a4e4e12aebmr4820862b3a.23.1761790140710;
        Wed, 29 Oct 2025 19:09:00 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414066d0esm17003502b3a.43.2025.10.29.19.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 19:09:00 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:08:43 +0800
Subject: [PATCH ath-next] wifi: ath12k: fix error handling in creating
 hardware group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-fix-hw-group-create-err-handling-v1-1-0659e4d15fb9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKrIAmkC/42NUQqDMBBEryL73ZVEa0371XsUP0LcmIAmNonWI
 t69wROUhYFhZvbtEClYivAodgi02mi9y4ZfClBGuoHQ9tlDxaqG3VmF2m5oPjgEv8yoAslESCF
 gLvejdQM2QmvGlbj2rYD8Zg6UNyfiBTIZdLQl6HJibEw+fE/2ys/8f8zKMV8ttajvN1Gr9uljL
 N+LHJWfpjILdMdx/ADTUvJ24QAAAA==
X-Change-ID: 20250902-fix-hw-group-create-err-handling-58ff01c84d78
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        a-development <a-development@posteo.de>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _-eSe1_p6fKRDdz2p4u-sWoF8fbttFe8
X-Proofpoint-GUID: _-eSe1_p6fKRDdz2p4u-sWoF8fbttFe8
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6902c8be cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=uChsZFC9AAAA:8 a=EUspDBNiAAAA:8
 a=Z_vG5fj8drChUe-V2goA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=ULtXvzFHYWHLyBAuiDia:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAxNSBTYWx0ZWRfX1SRczQFlN6Rn
 YifYod+MplAIG3oLVAcmTqijOEGn5uRBv/+EsIq7C6D5tJds8/o6GkbwoTft/1TZFdemQnLLEGS
 1DYltJSNWdQXG/DvF1RiQ2edE+rE1e8b4CAV/q2D4zqt9ISey0bjaZs98ra06tCMmQavfgqQJdk
 VPFWO+nvi383ec890LFNxgG4cFN9Fmv/UO2jBnTYQ7qFdkgZbBVcYP/fMpAQNMxurD68zgK9iXf
 E2TTuMLFH+NI9ELfhWbPnUxXWSMmzhAtRuRRvjq1qlD5Bcivy5+Z+PiX41ZU0U1qi+3Cx7mfuWN
 9wssBviKB8WiycqX8dlkYQ4FYHRrTO82BtaxNCvhUxYyvsfwf1RWrS3udMCIYhyk08eFLFZFfjS
 MlbpKrMiSoc4VnR5ENBm4dzHn8eb1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_190904_062956_D4004732 
X-CRM114-Status: GOOD (  16.53  )
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

In ath12k_core_init() when ath12k_core_hw_group_create() fails,
ath12k_core_hw_group_destroy() is called where for each device below
path would get executed

	ath12k_core_soc_destroy()
		ath12k_qmi_deinit_service()
			qmi_handle_release()

This results in kernel crash in case one of the device fails at
qmi_handle_init() when creating hardware group:

ath12k_pci 0000:10:00.0: failed to initialize qmi handle
ath12k_pci 0000:10:00.0: failed to initialize qmi :-517
ath12k_pci 0000:10:00.0: failed to create soc core: -517
ath12k_pci 0000:10:00.0: unable to create hw group
BUG: unable to handle page fault for address: ffffffffffffffb7
RIP: 0010:qmi_handle_release
Call Trace:
 <TASK>
 ath12k_qmi_deinit_service
 ath12k_core_hw_group_destroy
 ath12k_core_init
 ath12k_pci_probe

The detailed reason is, when qmi_handle_init() fails for a device
ab->qmi.handle is not correctly initialized. Then
ath12k_core_hw_group_create() returns failure, since error handing
is done for all device, eventually qmi_handle_release() is called for the
issue device and finally kernel crashes due to the uninitialized
ab->qmi.handle.

Fix this by moving error handling to ath12k_core_hw_group_create(), this
way the issue device can be skipped.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Link: https://lore.kernel.org/ath12k/fabc97122016d1a66a53ddedd965d134@posteo.net
Reported-by: a-development <a-development@posteo.de>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220518
Tested-by: a-development <a-development@posteo.de>
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 5d494c5cdc0da3189640751b8d191fa939ac3ff5..a2137b363c2fea4deef724b682c1e41788777c06 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -2106,14 +2106,27 @@ static int ath12k_core_hw_group_create(struct ath12k_hw_group *ag)
 		ret = ath12k_core_soc_create(ab);
 		if (ret) {
 			mutex_unlock(&ab->core_lock);
-			ath12k_err(ab, "failed to create soc core: %d\n", ret);
-			return ret;
+			ath12k_err(ab, "failed to create soc %d core: %d\n", i, ret);
+			goto destroy;
 		}
 
 		mutex_unlock(&ab->core_lock);
 	}
 
 	return 0;
+
+destroy:
+	for (i--; i >= 0; i--) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		mutex_lock(&ab->core_lock);
+		ath12k_core_soc_destroy(ab);
+		mutex_unlock(&ab->core_lock);
+	}
+
+	return ret;
 }
 
 void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
@@ -2188,7 +2201,7 @@ int ath12k_core_init(struct ath12k_base *ab)
 		if (ret) {
 			mutex_unlock(&ag->mutex);
 			ath12k_warn(ab, "unable to create hw group\n");
-			goto err_destroy_hw_group;
+			goto err_unassign_hw_group;
 		}
 	}
 
@@ -2196,8 +2209,7 @@ int ath12k_core_init(struct ath12k_base *ab)
 
 	return 0;
 
-err_destroy_hw_group:
-	ath12k_core_hw_group_destroy(ab->ag);
+err_unassign_hw_group:
 	ath12k_core_hw_group_unassign(ab);
 err_unregister_notifier:
 	ath12k_core_panic_notifier_unregister(ab);

---
base-commit: 43d31f3f26f766f357e95513ba75c5126ce17d4b
change-id: 20250902-fix-hw-group-create-err-handling-58ff01c84d78

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


